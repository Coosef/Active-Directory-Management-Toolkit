# Import the Active Directory module
Import-Module ActiveDirectory

# Get all users where PasswordNeverExpires is true
$users = Get-ADUser -Filter 'PasswordNeverExpires -eq $true' 

# For each user, set PasswordNeverExpires to false
foreach ($user in $users) {
    Set-ADUser -Identity $user.SamAccountName -PasswordNeverExpires $false
}
