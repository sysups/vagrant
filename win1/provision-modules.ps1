# this script is started by vagrant during the provisioning
# it installs the needed powershell dsc modules used in
# the powershell DSC configuation file "provision-dsc"

# Start-Sleep of 90 seconds has been added because windows 10
# takes a little bit longer than server 2016 to logon to the desktop
# the first time. The so called "We are preparing stuff for you"

Start-Sleep -s 90

Install-Module -Name xComputerManagement -force
Install-Module -Name NetworkingDsc -force