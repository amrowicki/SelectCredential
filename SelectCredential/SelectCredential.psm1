#Requires -Version 5.1
[CmdletBinding()]
param()

Write-Verbose $PSScriptRoot

Write-Verbose 'Import everything in sub folders folder'
foreach ($folder in @('private', 'public'))
{
    $root = Join-Path -Path $PSScriptRoot -ChildPath $folder
    if (Test-Path -Path $root)
    {
        Write-Verbose "Processing folder $root"
        $files = Get-ChildItem -Path $root -Filter *.ps1 -Recurse

        $files | Where-Object {$_.name -NotLike '*.Tests.ps1'} |
            ForEach-Object {
            Write-Verbose $_.basename
            . $_.FullName
        }
    }
}