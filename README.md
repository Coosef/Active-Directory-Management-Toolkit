# Active-Directory-Management-Toolkit

Active Directory Management Toolkit
1. passneverexpiresolan.ps1
Functionality: This PowerShell script disables the "Password Never Expires" setting for all users in Active Directory who currently have it enabled.

Usage Steps:

Download the script.
Open PowerShell as an administrator.
Run the script to update the password policy for all affected users.
Turkish Description:
Bu script, "Şifre Asla Sona Ermesin" seçeneği etkin olan tüm kullanıcılar için bu ayarı devre dışı bırakır. Güvenlik standartlarınızı güçlendirmek için kullanışlı bir araçtır.

English Description:
This script disables the "Password Never Expires" option for all users who have it enabled, providing a useful tool to strengthen your security standards.

2. passneverexpiresolanlisteleme.ps1
Functionality: This script lists all users in Active Directory for whom the "Password Never Expires" setting is enabled.

Usage Steps:

Download the script.
Open PowerShell as an administrator.
Run the script to list all users with the "Password Never Expires" setting.
Turkish Description:
"Şifre Asla Sona Ermesin" ayarı etkin olan tüm kullanıcıları listeler. Yöneticiler için hangi hesapların güncellenmesi gerektiğini belirlemede kolaylık sağlar.

English Description:
Lists all users with the "Password Never Expires" setting enabled, making it easy for administrators to identify which accounts need updating.

3. dc_ingrapor.ps1
Functionality: This script performs various checks and gathers information on user accounts, groups, updates, patches, backups, and security logs on a specified Domain Controller, summarizing the results in a report.

Usage Steps:

Download the script.
Open PowerShell as an administrator.
Run the script and enter the Domain Controller name when prompted to generate a comprehensive report.
Turkish Description:
Belirtilen Domain Controller üzerinde çeşitli kontroller yaparak raporlar üretir. Kullanıcı hesapları, gruplar, güncellemeler, yamalar, yedeklemeler ve güvenlik kayıtları hakkında bilgi toplar.

English Description:
Generates reports by performing various checks on the specified Domain Controller, gathering information about user accounts, groups, updates, patches, backups, and security logs.

4. duplicate.ps1
Functionality: This script identifies and lists all computers in the Active Directory that have duplicate IP address registrations.

Usage Steps:

Download the script.
Open PowerShell as an administrator.
Run the script to identify and list computers with duplicate IP addresses.
Turkish Description:
Active Directory'de aynı IP adresine sahip bilgisayarları tespit eder ve listeler. Ağınızdaki IP çakışmalarını gidermek için kullanabilirsiniz.

English Description:
Identifies and lists computers in Active Directory with duplicate IP addresses, useful for resolving IP conflicts in your network.

These descriptions and steps will help guide users on how to use and benefit from these scripts effectively within your GitHub repository
