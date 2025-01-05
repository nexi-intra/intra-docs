param (
  $org = "nexi-intra",
  $repo = "koksmat-captain",
  $cleanDocusaurusTargetFolder = $true
  
)
# Define the output directory
$docsRootDir = Join-Path $env:workdir 'docs' $org $repo
$docsDir = Join-Path $docsRootDir 'output'
$docusaurusRootDir = Join-Path $PSScriptRoot ".." ".." ".." ".." "docs" "repo" 

if (-not (Test-Path -Path $docsDir)) {
  throw "The output directory does not exist. Please run the build-documentation.ps1 script first."
}

if (-not (Test-Path -Path $docusaurusRootDir)) {  
  throw "The $docusaurusRootDir directory does not exist."
}
$docusaurusRootDir = resolve-path $docusaurusRootDir
write-host "working with" $docusaurusRootDir

$targetDir = Join-Path $docusaurusRootDir  $org $repo

if ((Test-Path -Path $$targetDir) -and $cleanDocusaurusTargetFolder) { 
  Remove-Item -Path $targetDir -Recurse -Force
}
else {
  New-Item -Path $targetDir -ItemType Directory -Force | Out-Null
}
write-host "Copying files from $docsDir to $targetDir"
# copy all files from $docsDir to $targetDir
Copy-Item -Path (join-path $docsDir "*") -Destination $targetDir -Recurse -Force 
write-host "Copied files to $targetDir"

