# SelectCredential
A module for selecting the credential stored in variables

## Prerequirements
    - You need to have Windows PowerShell 5.1 or newer or PowerShell Core.
    - Create one or more credentials object and store them in variables. You can also export them with Export-Clixml cmdlet and import them with Import-Clixml.

## Getting Started
Install this Module from the PSGallery and Import the module

    Install-Module SelectCredential
    Import-Module SelectCredential

## Basic usage
    - Create one or more credentials object and store them in variables.
    - Run the Select-Credential function and select one credential from menu.
    - Run the Select-Credential as the parameter value in other cmdlets e.g. Enter-PSSession -ComputerName srv1.contoso.com -Credential (Select-Credential).
    - Use the Cred alias for the Select-Credential function.

## Example

##### Using the Select-Credential in PowerShell Core with Enter-PSSession cmdlet
![](https://raw.githubusercontent.com/amrowicki/SelectCredential/master/README/SelectCredential1.gif)

##### Using the Cred alias in PowerShell Core with Enter-PSSession cmdlet
![](README\SelectCredential2.gif)

##### Using the Cred alias in Windows PowerShell with Enter-PSSession cmdlet
![](README\SelectCredential3.gif)

##### Using the Cred alias in Windows PowerShell ISE with Enter-PSSession cmdlet
![](README\SelectCredential4.gif)

##### Using the Cred alias in Visual Studio Code with newly generated credentials
![](README\SelectCredential5.gif)

## More information
Different types of menus are displayed on different PowerShell hosts.
On Windows PowerShell console and PowerShell Core console credential can be selected using the up and down arrows, then pressing enter.
On other hosts, the credential can be chosen by entering number, then pressing enter.