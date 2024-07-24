# Script name
script_name = "Domain Controller Test"

# Script description
script_description = "This script checks user accounts, groups, updates, patches, backups, and security logs on your domain controller and generates a report summarizing the test results."

# User-entered DC name
dc_name = input("Enter the name of the Domain Controller to be tested: ")

# Script execution
print(f"**{script_name} - {script_description}**")
print(f"Tested Domain Controller: {dc_name}")

# Test Procedures
# ... (here, add the codes between "User Accounts and Groups" and "Security Logs" from the code you provided)

# Report Generation

$report_text = ""

# Test Results Reporting

# User Accounts and Groups
$report_text += "**User Accounts and Groups:**\n\n"
$report_text += Get-ADUser -Filter * | ForEach-Object {
    if ($_.PasswordLastSet -lt (Get-Date).AddDays(-90)) {
        "**Warning:** User `$_.SamAccountName`'s password is older than 90 days.\n"
    }
    if ($_.LockoutThreshold -eq 0) {
        "**Warning:** Account lockout is not enabled for user `$_.SamAccountName`.\n"
    }
}

# Least privilege principle
$report_text += Get-ADUser -Filter * | ForEach-Object {
    if ($_.Enabled -eq $True) {
        $groups = Get-ADGroupMember -Identity $_.SamAccountName
        if ($groups.Count -gt 1) {
            "User `$_.SamAccountName` is a member of the following groups: $($groups | Select-Object -ExpandProperty Name)\n"
        }
    }
}

# Underutilized or old user accounts
$report_text += Get-ADUser -Filter {$_.LastLogon -lt (Get-Date).AddDays(-30)} | ForEach-Object {
    "**Warning:** User `$_.SamAccountName` has not logged in in the last 30 days.\n"
}

# Updates and Patches
$report_text += "**Updates and Patches:**\n\n"
$report_text += Get-Hotfix -ComputerName $dc_name | ForEach-Object {
    if ($_.InstalledOn -lt (Get-Date).AddDays(-30)) {
        "**Warning:** Update `$_.HotfixID` is older than 30 days.\n"
    }
}

# Backup and Recovery
$report_text += "**Backup and Recovery:**\n\n"
$last_backup = Get-WmiObject -Class Win32_Backup -ComputerName $dc_name | Select-Object -Property BackupStartTime -Last 1
if ($last_backup -eq $null) {
    $report_text += "**Error:** Domain Controller's last backup date could not be found.\n"
} else {
    $report_text += "Last backup date: $($last_backup.BackupStartTime)\n"
}

# Security Logs
$report_text += "**Security Logs:**\n\n"
$report_text += Get-EventLog -LogName Security -Source "AD DS Security" | ForEach-Object {
    if ($_.EventID -eq 4768) {
        "**Warning:** Account lockout event: $($_.Message)\n"
    }
    if ($_.EventID -eq 4740) {
        "**Warning:** Unsuccessful logon attempt: $($_.Message)\n"
    }
}

# Save the report
$report_path = "C:\temp\DC_Test_Report.txt"
Set-Content $report_path $report_text

# Open the report
Start-Process $report_path

# Test completed
