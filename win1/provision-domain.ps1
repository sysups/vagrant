$joinCred = New-Object pscredential -ArgumentList ([pscustomobject]@{
    UserName = $null
    Password = (ConvertTo-SecureString -String 'TempJoinPA$$' -AsPlainText -Force)[0]
})
Add-Computer -Domain "lab.pri" -Options UnsecuredJoin,PasswordPass -Credential $joinCred

Restart-Computer -Force

# Start-Sleep -s 30
# Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False