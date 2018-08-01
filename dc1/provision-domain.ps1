# This is the 3rd script executed by Vagrant during provisioning.
# The script promotes the dc1 vm to the first domain controller of
# the lab.pri domain.
# Since this is a testlab, having the password in plain text is no issue.
# For production environments, you possibly should do this differently.

$secpasswd = ConvertTo-SecureString 'TestLab01!' -AsPlainText -Force
$SafeModePW = New-Object System.Management.Automation.PSCredential ('guest', $secpasswd)

Import-Module ADDSDeployment

Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "WinThreshold" -DomainName "lab.pri" -DomainNetbiosName "LAB" -ForestMode "WinThreshold" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -SafeModeAdministratorPassword $secpasswd -Force:$true