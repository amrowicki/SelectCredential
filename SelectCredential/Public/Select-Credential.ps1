function Select-Credential
{
    <#
    .Synopsis
    Selects one of the credentials stored in the variables.

    .DESCRIPTION
    Function lists all available credentials stored in the variables and allow to visually select one.

    .EXAMPLE
    Select-Credential

    This will list all available credentials stored in the variables and then creates a menu from which one can be chosen. Returns chosen credential object.

    .OUTPUTS
    System.Management.Automation.PSCredential

    .NOTES
    Author:  Adam W. Mrowicki
    Twitter: @AdamMrowicki
    #>

    [CmdletBinding()]
    [OutputType([PSCredential])]
    [Alias('Cred')]
    param()

    process
    {
        $Creds = Invoke-Command {
            foreach ($Variable in (Get-Variable).GetEnumerator())
            {
                if ($null -ne $Variable.Value)
                {
                    ($Variable | Where-Object {$_.Value.GetType() -eq [PSCredential]}).Value
                }
            }
        } | Sort-Object -Unique Username

        if ($null -ne $Creds)
        {
            Start-CredentialsMenuController -MenuItems $Creds
        }
        else
        {
            Write-Host 'No credentials found'
            Get-Credential
        }
    }
}