---
title: "Provision SharePoint site for Koksmat"
date: "2025-01-06T08:10:11Z"
description: "Description for run.ps1."
tags: []
author: "Unknown"
---

```powershell
#>
$root = [System.IO.Path]::GetFullPath(( join-path $PSScriptRoot ..)) 

write-host "Root: $root"

. "$root/.koksmat/pwsh/check-env.ps1" "PNPAPPID", "PNPSITE", "PNPCERTIFICATE", "KOKSMATSITE", "GITHUB_APPID", "GITHUB_INSTALLATION_ID", "GITHUB_PRIVATE_KEY", "GITHUB_ORG"
. "$root/.koksmat/pwsh/connectors/sharepoint/connect.ps1"
# . "$root/.koksmat/pwsh/connectors/github/connect.ps1"

Connect-PnPOnline -Url $ENV:KOKSMATSITE -ClientId $PNPAPPID -Tenant $PNPTENANTID -CertificatePath "$PNPCERTIFICATEPATH"
```

