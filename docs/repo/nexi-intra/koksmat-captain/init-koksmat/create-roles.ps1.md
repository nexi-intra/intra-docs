---
title: "create-roles.ps1"
date: "2025-01-06T08:10:11Z"
description: "Description for create-roles.ps1."
tags: []
author: "Unknown"
---

```powershell
function CreateOrFetchKoksmatRole($name) {
  $captain = az ad sp list --display-name "koksmat-$name" | ConvertFrom-Json
  if (!$captain) {
    $newCaptain = az ad sp create-for-rbac --name "koksmat-captain" --skip-assignment | ConvertFrom-Json
    $captain = az ad sp list --display-name "koksmat-$name" | ConvertFrom-Json 
  }
  return $captain
}

az role definition list --output table  --query "[].{RoleName:roleName}" 

#$captain = CreateOrFetchKoksmatRole "captain"
#$captain.appDisplayName
```

