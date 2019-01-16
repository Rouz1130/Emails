
$template = 'office365.html'
$final_email = 'final_email.html'

$ReportServices =@(

"Microsoft Intune",
"Dynamics 365",
"Office 365 Portal",
"Office Subscription",
"Social Engagement",
"Power BI",
"Microsoft Teams",
"Yammer Enterprise",
"Yammer.com")

$ReportServices =
@([pscustomobject]@{name="Exchange Online";color="#D73b02", footer=""},
[pscustomobject]@{name="SharePoint Online";color="#fff"},
[pscustomobject]@{name="Skype for Business";color="#fff"})

foreach ($service in $ReportServices)
{

  (Get-Content $template) |


    Foreach-Object {
      $_ -replace '\[HEADER_COLOR\]',$service.color`
        -replace '\[REPORT_NAME\]',$service.name`
        -replace '\[STATUS_MESSAGE\]','Investigating'
      
    }  |
    Set-Content ($service.name + ".html")

}
