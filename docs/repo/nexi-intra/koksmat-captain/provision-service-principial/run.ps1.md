---
title: "run.ps1"
date: "2025-01-05T16:58:42Z"
description: "Description for run.ps1."
tags: []
author: "Unknown"
---

---
title: Provision a service principal
---


```powershell

$root = [System.IO.Path]::GetFullPath(( join-path $PSScriptRoot ..)) 

. "$root/.koksmat/pwsh/check-env.ps1" "GRAPH_APPID", "GRAPH_APPSECRET", "GRAPH_APPDOMAIN", "OWNER_UPN", "TARGET_APPID"



try {

}
catch {
  write-host "Error: $_" -ForegroundColor:Red
  
}
```

