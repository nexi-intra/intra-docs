<#---
title: Parse PowerShell
---

#>


function Parse-PowerShell {
  param (
    [string]$Content = @"
<#
Hello, this is a markdown block.
#>
Write-Host 'Hello, this is code.'
$env:FOO 
"@
  )

  # Initialize an array to hold the segments
  $segments = @()

  # Define regex patterns
  $markdownStartPattern = '<#'
  $markdownEndPattern = '#>'

  # Initialize state variables
  $currentIndex = 0
  $isMarkdown = $false

  while ($currentIndex -lt $Content.Length) {
    if (-not $isMarkdown) {
      # Look for the start of a markdown block
      $start = $Content.IndexOf($markdownStartPattern, $currentIndex)
      if ($start -eq -1) {
        # No more markdown blocks; add the rest as code
        $segments += [PSCustomObject]@{ Type = 'Code'; Content = $Content.Substring($currentIndex) }
        break
      }
      else {
        if ($start -gt $currentIndex) {
          # Add code before the markdown block
          $codeSegment = $Content.Substring($currentIndex, $start - $currentIndex)
          $segments += [PSCustomObject]@{ Type = 'Code'; Content = $codeSegment }
        }
        # Update currentIndex to after the start marker
        $currentIndex = $start + $markdownStartPattern.Length
        $isMarkdown = $true
      }
    }
    else {
      # Look for the end of the markdown block
      $end = $Content.IndexOf($markdownEndPattern, $currentIndex)
      if ($end -eq -1) {
        # No end marker found; treat the rest as markdown
        $markdownSegment = $Content.Substring($currentIndex)
        $segments += [PSCustomObject]@{ Type = 'Markdown'; Content = $markdownSegment }
        break
      }
      else {
        # Extract markdown content
        $markdownSegment = $Content.Substring($currentIndex, $end - $currentIndex)
        $segments += [PSCustomObject]@{ Type = 'Markdown'; Content = $markdownSegment }
        # Update currentIndex to after the end marker
        $currentIndex = $end + $markdownEndPattern.Length
        $isMarkdown = $false
      }
    }
  }

  return $segments
}
#Parse-PowerShell