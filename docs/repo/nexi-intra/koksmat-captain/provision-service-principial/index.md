---
title: "Provision a service principal"
date: "2025-01-06T08:10:11Z"
description: "Description for run.ps1."
tags: []
author: "Unknown"
---

```powershell
#>
$root = [System.IO.Path]::GetFullPath(( join-path $PSScriptRoot ..)) 

. "$root/.koksmat/pwsh/check-env.ps1" "GRAPH_APPID", "GRAPH_APPSECRET", "GRAPH_APPDOMAIN", "OWNER_UPN", "TARGET_APPID"



try {

}
catch {
  write-host "Error: $_" -ForegroundColor:Red
  
}
```

