function Show-CredentialsMenu
{
    <#
    .Synopsis
    Draws a menu to choose your credential.

    .DESCRIPTION
    Draws a menu from the provided list of credentials.

    .PARAMETER MenuItems
    List of objects from which the menu will be created.

    .PARAMETER MenuPosition
    The current cursor position in the menu.

    .EXAMPLE
    Show-CredentialsMenu -MenuItems $Credentials -MenuPosition 0

    This will draw a menu from the provided list of credentials and set the cursor position on the first element (if it is running in ConsoleHost).

    .NOTES
    Author:  Adam W. Mrowicki
    Twitter: @AdamMrowicki
    #>

    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $MenuItems,
        [Parameter(Mandatory = $true)]
        [UInt32]
        $MenuPosition
    )

    $MenuItems = $MenuItems.username

    foreach ($item in $MenuItems)
    {
        if ($Host.Name -eq 'ConsoleHost')
        {
            if ($MenuItems.IndexOf($item) -eq $MenuPosition) {Write-Host "> $($item)"}
            else {Write-Host "  $($item)"}
        }
        else {Write-Host "$($MenuItems.IndexOf($item) + 1). $($item)"}
    }
}