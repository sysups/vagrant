# This PowerShell DSC configuration script is executed as 2nd provisioning
# script by vagrant during provisioning. It places a text file, installs
# needed Features (for domain promotion) and sets the needed IP configuration.

[DSCLocalConfigurationManager()]
configuration LCMConfig
{
    Node localhost
    {
        Settings
        {
            RebootNodeIfNeeded  = $False
            # ActionAfterReboot   = 'ContinueConfiguration'
        }
    }
}

LCMConfig

Set-DscLocalConfigurationManager -Path .\LCMConfig

Configuration AddMyFile
{
    Import-DscResource -Module xComputerManagement
    Import-DscResource -Module NetworkingDsc

    File HelloWorld
    {
        Ensure = "Present"
        DestinationPath = "C:\hello.txt"
        Contents = "World"
    }

    WindowsFeature ADDSInstall
    {
        Ensure = 'Present'
        Name = 'AD-Domain-Services'
        IncludeAllSubFeature = $true
    }

    WindowsFeature RSATTools
    {
        DependsOn= '[WindowsFeature]ADDSInstall'
        Ensure = 'Present'
        Name = 'RSAT-AD-Tools'
        IncludeAllSubFeature = $true
    }

    IPAddress NewIPAddress
        {
            IPAddress      = "192.168.56.11"
            InterfaceAlias = "Ethernet 2"
            AddressFamily  = "IPV4"
        }

    DefaultGatewayAddress SetDefaultGateway
        {
            Address        = '192.168.56.1'
            InterfaceAlias = 'Ethernet 2'
            AddressFamily  = 'IPv4'
        }

    DnsServerAddress DnsServerAddress
        {
            Address        = '192.168.56.1','127.0.0.1'
            InterfaceAlias = 'Ethernet 2'
            AddressFamily  = 'IPv4'
            Validate       = $false
        }
}

AddMyFile

Start-DscConfiguration -Wait -Force -Verbose -Path .\AddMyFile