# vagrant
This vagrant project assumes you are using a Windows platform, preferably Windows 10,
as that is what this setup is testen on.

The environment is using VirtualBox as Hypervisor, supported by Vagrant and Cygwin
to automate the deployment and configuration from code.

Yes, this is a form of Infrastructure as Code! so if you are interested in this,
then going through this project will give you some nice pointers about the subject.

This vagrant project enables you to **nearly** "zero-touch" install a small lab environment
consisting of a domain called lab.pri which contains three VMs:

VM Name | Operating System | Role | Trial license
--- | --- | --- | ---
dc1 | Windows Server 2016 standard | Domain Controller | 180 days
server1 | Windows Server 2016 standard | Member Server | 180 days
win1 | Windows 10 Enterprise | Workstation | 90 days

This is a quickstart and no extensive documentation of how Vagrant works. If you want to
know the details of the configuration, then please invest in reading the documentation:

https://www.vagrantup.com/docs/index.html


## Staging the environment
Clone or download this repository and locate it in an convenient location on your system

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

## Cygwin
Now that the bundle above is installed. Open the Cygwin64 terminal.
Change directory to where you cloned/downloaded this repository.
e.g. C:\Git\Vagrant

## DC1 - Vagrant up
Change directory into the dc1 folder
type:
```vagrant up```
next wait for the magic to complete. When it is complete you will
get back to the blinking Cygwin prompt.
In the meantime you see the gui of the VM reboot a couple of times
On midrange hardware with SSD, the provisioning of dc1 shoudl take
about 20 minutes. So take a cup of coffee

Once done, you can logon to dc1 with either the LAB\Administrator or
LAB\Vagrant uername. Both have a password of "vagrant"
The Administrato account is Domain Admin.

Make sure you run the New-ADComputer.ps1 script once logged in.
The file is located in C:\Vagrant, which is the default shared
folder when starting vm's with vagrant.

Without running this script, you cannot auto-join the server1 and win1
computers to the domain, once they start their provisioning

## SERVER1 / WIN1 - Vagrant up
ONLY when the domain controller (dc1) is up an running you should start
provisioning the server1 and win1 VMs.
first change directory to either the server1 or win1 folder, whichever
you want to provision first and type:
```vagrant up```

Repeat this process for the last vm once the 2nd vm of your choice is
provisioned.

## Gracefull shutdown
You could shutdown the vm's using VirtualBox, but instead, its better
to do it using the command
```vagrant halt````
This way, it clears redirected folders and ports correctly.
use the vagrant halt command in Cygwin in each of the vm folders;
dc1, server1, win1

## Destroying the lab
You can destroy your lab VMs one by one by changing directory of each
VM and then typing
```vagrant destroy```

## RDP instead of VBox Console
You can RDP to each VM, but you will have to watch for the redirected
port number for each vm when Vagrant spins up the vm.
The first VM usually gets redirected to port 33389.
The second, when the first is also online, to port 2200
Just watch the Cgywin console verbose logging when the VM boots for
the port.

Once you know the port you can use a remote desktop client to connect
to, for example: 127.0.0.1:33389 or localhost:33389

## Quesions or requests
If you have any questions or requests, please let me know at
info@sysups.nl or send me a direct message on Linkedin:
www.linkedin.com/in/bbictcoach
