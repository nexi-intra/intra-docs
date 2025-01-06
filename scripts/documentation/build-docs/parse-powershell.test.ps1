. "$PSScriptRoot\parse-powershell.ps1"


write-host "Test the Parse-PowerShell function with expected front matter and content." -ForegroundColor Yellow

try {
  $result = Extract-FrontMatter -Content @"
<#---
title: Parse PowerShell
---#>
<#
# Hello
#>
write-host "Hello, World!"

"@
  $result.FrontMatter
  $result.Content
  
  if ($result.FrontMatter.title -ne "Parse PowerShell") {
    throw "Title mismatch"
  }

}

catch {
  write-host "Error: $_" -ForegroundColor:Red
}


write-host "Test the Parse-PowerShell function with no front matter" -ForegroundColor Yellow

try {
  $result = Extract-FrontMatter -Content @"
<#
# Hello
#>
write-host "Hello, World!"

"@
  $result.FrontMatter
  $result.Content
  
  if ($result.FrontMatter.Values.Count -gt 0) {
    throw "Unexpected front matter"
  }

}

catch {
  write-host "Error: $_" -ForegroundColor:Red
}


write-host "Test the Parse-PowerShell function with malformed front matter" -ForegroundColor Yellow

$catchedError = $false
try {
  $result = Extract-FrontMatter -Content @"
<#---
title: Parse PowerShell


# Hello
#>
write-host "Hello, World!"

"@
  $result.FrontMatter
  $result.Content
  
  if ($result.FrontMatter.Values.Count -gt 0) {
    throw "Unexpected front matter"
  }

}

catch {
  $catchedError = $true
 
}

if (-not $catchedError) {
  throw "Expected error"
}

write-host "Test the Parse-PowerShell function with mixed front matter and content" -ForegroundColor Yellow

$catchedError = $false
try {
  $result = Extract-FrontMatter -Content @"
<#---
title: Parse PowerShell

---
# Hello
#>
write-host "Hello, World!"

"@
  $result.FrontMatter
  $result.Content
  
  if ($result.FrontMatter.title -ne "Parse PowerShell") {
    throw "Title mismatch"
  }

  if ($result.Content.StartsWith("<#") -eq $false) {
    throw "Expected to have front matter stripped from content"
  }
}

catch {
  write-host "Error: $_" -ForegroundColor:Red
 
}

