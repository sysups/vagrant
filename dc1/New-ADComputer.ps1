# Manually run this script on the server once the dc1 domain controller
# is operational

# Use this script to pre-create the server1 and win1 computer object.
# The password set is a one time password used in provision-domain.ps1
# of each individual vm. See server1 and win1 folder

New-ADComputer -Name "server1" -AccountPassword (ConvertTo-SecureString -String 'TempJoinPA$$' -AsPlainText -Force)
New-ADComputer -Name "win1" -AccountPassword (ConvertTo-SecureString -String 'TempJoinPA$$' -AsPlainText -Force)