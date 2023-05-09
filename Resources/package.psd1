@{
    Root = 'C:\Users\chien\OneDrive - Courant\Desktop\PSScripts\Offboard365Users\offboard365users.ps1'
    OutputPath = 'C:\Users\chien\OneDrive - Courant\Desktop\PSScripts\Offboard365Users\out'
    Package = @{
        Enabled = $true
        Obfuscate = $false
        HideConsoleWindow = $true
        DotNetVersion = 'v4.6.2'
        FileVersion = '0.9.0'
        FileDescription = ''
        ProductName = ''
        ProductVersion = ''
        Copyright = ''
        RequireElevation = $false
        ApplicationIconPath = ''
        PackageType = 'Console'
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
        # IgnoredModules = @()
    }
}
        