function retrieveOS {
    <#
    .SYNOPSIS
    Retrieves system information.

    .DESCRIPTION
    
    #>
    Write-Host "`nOS Information`n--------------`n"
    Get-CimInstance -ClassName Win32_ComputerSystem | ForEach-Object {
        Write-Host "`tAdmin Password Status: $($_.AdminPasswordStatus)"
        Write-Host "`tBootupState : $($_.BootupState)"
        Write-Host "`tStatus : $($_.Status)"
        Write-Host "`tPrimaryOwnerName : $($_.PrimaryOwnerName)"
        Write-Host "`tRoles : $($_.Roles)"
        Write-Host "`tCurrent Time Zone : $($_.CurrentTimeZone)"
        Write-Host "`tDomain : $($_.Domain)"
        Write-Host "`tEnable Daylight Savings Time : $($_.EnableDaylightSavingsTime)"
        Write-Host "`tSystem Type : $($_.SystemType)"
        Write-Host "`tTotal Physical Memory : $($_.TotalPhysicalMemory)"
        Write-Host "`tUser Name : $($_.UserName)"
    }
    Write-Host "`n"
    
}

retrieveOS