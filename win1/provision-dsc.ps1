[DSCLocalConfigurationManager()]
configuration LCMConfig
{
    Node localhost
    {
        Settings
        {
            RebootNodeIfNeeded  = $True
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
        Ensure = 'Present'
        DestinationPath = 'C:\hello.txt'
        Contents = 'World'
    }

    IPAddress NewIPAddress
        {
            IPAddress      = '192.168.56.21'
            InterfaceAlias = 'Ethernet 2'
            AddressFamily  = 'IPV4'
        }

    DefaultGatewayAddress SetDefaultGateway
        {
            Address        = '192.168.56.1'
            InterfaceAlias = 'Ethernet 2'
            AddressFamily  = 'IPv4'
        }

    DnsServerAddress DnsServerAddress
        {
            Address        = '192.168.56.11'
            InterfaceAlias = 'Ethernet 2'
            AddressFamily  = 'IPv4'
            Validate       = $false
        }
}

AddMyFile

Start-DscConfiguration -Wait -Force -Verbose -Path .\AddMyFile 

