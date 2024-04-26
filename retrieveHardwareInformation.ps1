function retrieveHardwareInformation {
    <#
    .SYNOPSIS
    Retrieves details about the physical components of the endpoint.

    .DESCRIPTION
    Information collected is restricted to the processor, disk, and computer model characteristics.
    #>

    $computerSystemObject = Get-CimInstance -ClassName Win32_ComputerSystem
    $computerModel = [PSCustomObject]@{
        'Manufacturer' = $computerSystemObject.Manufacturer
        'Model' = $computerSystemObject.Model
        'OEM String Array' = $computerSystemObject.OEMStringArray
        'System Family' = $computerSystemObject.SystemFamily
        'System SKU Number' = $computerSystemObject.SystemSKUNumber
    }

    Write-Host "`nModel Information`n----------------`n"
    $computerModel.PSObject.Properties | ForEach-Object {
        Write-Output "$($_.Name): $($_.Value)"
    }

    Write-Host "`n"

    $processorObject = Get-CimInstance -ClassName Win32_Processor
    $computerProcessor = [PSCustomObject]@{
        'Processor Name' = $processorObject.Name
        'Processor Description' = $processorObject.Description
        'Processor Type' = $processorObject.ProcessorType
        'Processor ID' = $processorObject.ProcessorId
        'Address Width' = $processorObject.AddressWidth
        'Data Width' = $processorObject.DataWidth
        'ExtClock' = $processorObject.ExtClock
        'Max Clock Speed' = $processorObject.MaxClockSpeed
        'L2 Cache Size' = $processorObject.L2CacheSize
        'L3 Cache Size' = $processorObject.L3CacheSize
        'Number of Cores' = $processorObject.NumberOfCores
        'Number of Enabled Cores' = $processorObject.NumberOfEnabledCore
        'Number of Logical Processors' = $processorObject.NumberOfLogicalProcessors
        'Threat Count' = $processorObject.ThreadCount
    }

    Write-Host "`nProcessor Information`n----------------`n"
    $computerProcessor.PSObject.Properties | ForEach-Object {
        Write-Host "$($_.Name): $($_.Value)"
    }
    Write-Host "`n"

    $diskDriveObject = Get-CimInstance -ClassName Win32_DiskDrive
    $logicalDiskObject = Get-CimInstance -ClassName Win32_LogicalDisk
    $computerDisk = [PSCustomObject]@{
        'Device ID' = $diskDriveObject.DeviceID
        'Partitions' = $diskDriveObject.Partitions
        'Bytes Per Sector' = $diskDriveObject.BytesPerSector
        'Sectors Per Track' = $diskDriveObject.SectorsPerTrack
        'Interface' = $diskDriveObject.InterfaceType
        'Size' = $diskDriveObject.Size
        'Model' = $diskDriveObject.Model
        'Serial Number' = $diskDriveObject.SerialNumber
        'Capabilities' = $diskDriveObject.Capabilities
        'Capability Descriptions' = $diskDriveObject.CapabilityDescriptions
        'Firmware Revision' = $diskDriveObject.FirmwareRevision
        'Root Directory' = $logicalDiskObject.DeviceID
        'Free Space' = $logicalDiskObject.FreeSpace
        'Compressed' = $logicalDiskObject.Compressed
        'Filesystem' = $logicalDiskObject.FileSystem
        'Media Type' = $logicalDiskObject.MediaType
        'Volume Serial Number' = $logicalDiskObject.VolumeSerialNumber
    }

    Write-Host "Disk Information`n----------------`n"
    $computerDisk.PSObject.Properties | ForEach-Object {
        Write-Host "$($_.Name): $($_.Value)"
    }
    Write-Host "`n"

    Write-Host "Disk Partitions`n---------------`n"
    Get-CimInstance -ClassName Win32_DiskPartition | ForEach-Object {
        Write-Host "Index: $($_.Index)"
        Write-Host "`tName: $($_.Name)"
        Write-Host "`tType: $($_.Type)"
        Write-Host "`tBootable: $($_.Bootable)"
        Write-Host "`tPrimaryPartition: $($_.PrimaryPartition)"
        Write-Host "`tBootPartition: $($_.BootPartition)"
        Write-Host "`tSize: $($_.Size)"
    }

}

retrieveHardwareInformation