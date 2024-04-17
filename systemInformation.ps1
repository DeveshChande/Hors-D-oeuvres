function Get-SystemInfo {
    <#
    .SYNOPSIS
    Retrieves system information.

    .DESCRIPTION
    Details information about the system - Name, Windows Version, Build Number, Serial Number, Hostname, OS Architectur,
    Manufacturer, Country Code, Language, Installation Date, Last Bootup Time, Number of Users, Registered User,
    Number of Processes, Boot Volume, System Device, System Directory, System Drive, and Windows Directory.
    #>

    $os = Get-CimInstance -ClassName Win32_OperatingSystem

    $systemInformation = [PSCustomObject]@{
        Name = $os.Caption
        'Windows Version' = $os.Version
        'Build Number' = $os.BuildNumber
        'Serial Number' = $os.SerialNumber
        HostName = $os.CSName
        'OS Architecture' = $os.OSArchitecture
        'Manufacturer' = $os.Organization
        'Country Code' = $os.CountryCode
        'Language' = $os.MUILanguages -join ', '
        'Timezone' = $os.CurrentTimeZone
        'Installation Date' = $os.InstallDate
        'Last Bootup Time' = $os.LastBootUpTime
        'Number of Users' = $os.NumberOfUsers
        'Registered User' = $os.RegisteredUser
        'Number of Processes' = $os.NumberOfProcesses
        'Boot Volume' = $os.BootDevice
        'System Device' = $os.SystemDevice
        'System Directory' = $os.SystemDirectory
        'System Drive' = $os.SystemDrive
        'Windows Directory' = $os.WindowsDirectory
    }

    $systemInformation.PSObject.Properties | ForEach-Object {
        Write-Host "$($_.Name): $($_.Value)"
    }
}

Get-SystemInfo