# This is the 3rd script executed by Vagrant during provisioning.
# The script has the vm join the lab.pri domain using the
# temporary password set in New-ADComputer.ps1 of the dc1 vm

$joinCred = New-Object pscredential -ArgumentList ([pscustomobject]@{
    UserName = $null
    Password = (ConvertTo-SecureString -String 'TempJoinPA$$' -AsPlainText -Force)[0]
})
Add-Computer -Domain "lab.pri" -Options UnsecuredJoin,PasswordPass -Credential $joinCred

Restart-Computer