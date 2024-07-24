# Import the Active Directory module
Import-Module ActiveDirectory

# Get all users where PasswordNeverExpires is true and list them
Get-ADUser -Filter 'PasswordNeverExpires -eq $true' | Format-Table Name, SamAccountName, PasswordNeverExpires
