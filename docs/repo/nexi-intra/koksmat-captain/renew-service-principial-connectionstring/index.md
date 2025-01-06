---
title: "Renew Service Principal Connection String"
date: "2025-01-06T08:10:11Z"
description: "Description for run.ps1."
tags: []
author: "Unknown"
---

## Add a certificate to an application and share the secret with the owner

End result is that a text file containing the environment variables needed to connect a 
Service Principal is created and shared with the owner using the owners OneDrive.

The owners gets an email notifying them that connection information has been shared with them.


```powershell

$root = [System.IO.Path]::GetFullPath(( join-path $PSScriptRoot ..)) 

. "$root/.koksmat/pwsh/check-env.ps1" "GRAPH_APPID", "GRAPH_APPSECRET", "GRAPH_APPDOMAIN", "OWNER_UPN", "TARGET_APPID"

$subject = "CN=$env:OWNER_UPN"

try {
```

### Generate a certificate


```powershell


  . "$PSScriptRoot/generate-cert.ps1" 

  New-Cert -SubjectName $subject -BaseFileName "app"
```

### Add the certificate to the application


```powershell
 
  $certDir = $env:CERTDIR 
  $pfx = Get-Content -Path (join-path $certDir "app.b64pfx") -Raw 
  $cert = Get-Content -Path (join-path $certDir "app.b64cer") -Raw 

  
  . "$PSScriptRoot/add-cert.ps1"  -ApplicationId $env:TARGET_APPID -Subject $subject  -certBase64 $cert
```

### Share the secret with the owner


```powershell

  . "$PSScriptRoot/share-secret.ps1" -secret $pfx 

}
catch {
  write-host "Error: $_" -ForegroundColor:Red
  
}
```

### Environment Variables Used

| Environment Variable |
|----------------------|| CERTDIR |\n| OWNER_UPN |\n| TARGET_APPID |\n


