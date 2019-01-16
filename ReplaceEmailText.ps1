# Invoke-Command -computername $computerName {Remove-Item -path $args[0] -Recurse} -ArgumentList $RegKey
$template = 'office365.html'
$final_email =  'final_email.html'

(Get-Content $template) |

Foreach-Object {
  $_ -replace '\[HEADER_COLOR\]','#0d1121'`
     -replace '\[STATUS_MESSAGE\]','Investigating'
  
}  
Set-Content $final_email
