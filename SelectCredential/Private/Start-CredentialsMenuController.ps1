function Start-CredentialsMenuController
{
    <#
    .Synopsis
    Controls the menu and performs an action dependent on the selection.

    .DESCRIPTION
    Controls the menu and performs an action dependent on the selection.

    .PARAMETER MenuItems
    List of objects from which the menu will be created.

    .EXAMPLE
    Start-CredentialsMenuController -MenuItems $Credentials

    This will draw a menu from the provided list of credentials.

    .NOTES
    Author:  Adam W. Mrowicki
    Twitter: @AdamMrowicki
    #>

    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $MenuItems
    )

    begin
    {
        $MenuPosition = 0
        if ($host.name -ne 'Windows PowerShell ISE Host')
        {
            $currentPosition = [System.Console]::CursorTop
            [console]::CursorVisible = $false
        }
    }
    process
    {
        Show-CredentialsMenu -MenuItems $MenuItems -MenuPosition $MenuPosition
        if ($Host.Name -eq 'ConsoleHost')
        {
            While ($true)
            {
                switch ($host.ui.rawui.readkey("NoEcho,IncludeKeyDown").virtualkeycode)
                {
                    13 {return $MenuItems[$MenuPosition]} #Enter
                    27 {return $null } #Escape
                    38 {if (--$MenuPosition -lt 0) {$MenuPosition = $MenuItems.length - 1}} #Up
                    40 {if (++$MenuPosition -gt $MenuItems.length - 1) {$MenuPosition = 0}} #Down
                    {$PSItem -ne 27} # Not Escape
                    {
                        [System.Console]::SetCursorPosition(0, $currentPosition)
                        Show-CredentialsMenu -MenuItems $MenuItems -MenuPosition $MenuPosition
                    }
                }
            }
        }
        else
        {
            While ($true)
            {
                switch (Read-Host -Prompt "Select credential and press Enter (0 to cancel)")
                {
                    {$PSItem -in 1..$($MenuItems.length)} {return $MenuItems[$PSItem - 1]}
                    0 {return $null }
                    Default {Show-CredentialsMenu -MenuItems $MenuItems -MenuPosition $MenuPosition}
                }
            }
        }
    }
    end
    {
        if ($host.name -ne 'Windows PowerShell ISE Host')
        {
            [console]::CursorVisible = $true
        }
    }
}