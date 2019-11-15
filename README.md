# sasw-powershell-utilities

## Security Basics
1. Specify the Execution Policy to Restricted, RemoteSigned, AllSigned, Unrestricted or ByPass by opening
PowerShell console as an administrator.
`Set-ExecutionPolicy RemoteSigned`
To get the current one
`Get-ExectionPolicy`

2. PowerShell requires always providing the full path name to prevent command highjacking. Extensions is not required but it is recommended. Everyting goes towards preventing unintentional execution of code.

3. To unblock a file downloaded from a different system execute `unblock-file C:\foo\downloaded.ps1`

4. More info by running `help about_Execution_Policies`

## Scopes
In PowerShell there are scopes such as Global, Script, Private and Numbered Scopes. Scripts run in their own scope. For any reference, PowerShell will first look at the current scope, if it cannot find it it will go upwards through the scopes until it finds it or throws an error. An important thing is that PowerShell can only write or create in the current scope. In the ISE everything runs in the global scope and that's a thing to be aware of.

## Profiles
1. In PowerShell there can be profiles to have tools for different needs. See `$profile | select *hosts* | format-list`

2. More info by runnin 'help about_profiles'