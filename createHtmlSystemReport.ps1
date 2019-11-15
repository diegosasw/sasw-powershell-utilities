<#
Parametized script to generate HTML report of system event log
#>

Param (
[string]$log = "System",
[string]$computerName = $env:COMPUTERNAME,
[string]$reportTitle = "Event Log Report",
[int32]$newest = 500,
[Parameter(Mandatory,HelpMessage = "Enter the path for the HTML file.")]
[string]$path
)

# Get event log data and group it
$data = Get-EventLog -logname $log -EntryType Error -Newest $newest -ComputerName $computerName |
Group-Object -Property Source -NoElement

# Create an HTML report
$footer = "<h5><i>report run $(Get-Date)</i></h5>"
$css = "http://jdhitsolutions.com/sample.css"
$precontent = "<h1>$ComputerName</h1><h2>Last $Newest error sources from $Log</h2>"

$data | Sort-Object -Property Count, Name -Descending |
Select-Object Count, Name |
ConvertTo-Html -Title $reportTitle -PreContent $preContent -PostContent $footer -CssUri $css |
Out-File -FilePath $path

invoke-item $path