# vagrant
## Chocolatey
First install Chocolatey on your pc or server that is going to host the VM's. execute this in an elevated powershell:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Cygwin & VirtualBox & Vagrant
Next install Cygwin, VirtualBox and Vagrant using Chocolatey using this command from a commandprompt or powershell

```
choco install cygwin virtualbox vagrant
```
