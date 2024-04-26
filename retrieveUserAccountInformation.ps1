function retrieveUserAccountInformation {
    <#
    .SYNOPSIS
    Retrieves information about user accounts present on the host.

    .DESCRIPTION
    Details information about user accounts - Name, Domain, LocalAccount, SID, SID Type, Status, Lockout, Password Changable,
    Password Required, PasswordExpires.
    #>

    Write-Host "`nUser Accounts`n-------------`n"
    Get-CimInstance -ClassName Win32_UserAccount | ForEach-Object {
        Write-Host "Name: $($_.Name)"
        Write-Host "`tStatus: $($_.Status)"
        Write-Host "`tDomain: $($_.Domain)"
        Write-Host "`tDescription: $($_.Description)"
        Write-Host "`tPassword Expires: $($_.PasswordExpires)"
        Write-Host "`tPassword Changable: $($_.PasswordChangeable)"
        Write-Host "`tPassword Required: $($_.PasswordRequired)"
        Write-Host "`tLocal Account: $($_.LocalAccount)"
        Write-Host "`tSID: $($_.SID)"
        Write-Host "`tAccount Type: $($_.AccountType)"
        Write-Host "`tDisabled: $($_.Disabled)"
        Write-Host "`tLockout: $($_.Lockout)"
        Write-Host "`n"
    }
}

retrieveUserAccountInformation