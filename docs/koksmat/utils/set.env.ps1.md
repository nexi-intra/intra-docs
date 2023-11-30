

# set.env

PowerShell script which sets environment variables from a .env file. The script looks for the first .env file in the current folder and any of the parent folders.

Create a file called set.env.ps1 and store it in a folder on the `path` - on my mac I store it in the `<homedir>/go/bin/` folder.

```powershell

$loop = $true
$path = (Get-Location).Path
$debug = $true
do {
    $filename = "$path/.env"
    if ($debug) {
        write-output "Checking $filename"
    }
    if (Test-Path $filename) {
        if ($debug) {
            write-host -ForegroundColor Yellow "Using $filename" 
        }
        $lines = Get-Content $filename
            
        foreach ($line in $lines) {
                
            $nameValuePair = $line.split("=")
            if ($nameValuePair[0] -ne "") {
                # if ($debug) {
                #     write-host "Setting >$($nameValuePair[0])<"
                # }
                $value = $nameValuePair[1]
                
                for ($i = 2; $i -lt $nameValuePair.Count; $i++) {
                    $value += "="
                    $value += $nameValuePair[$i]
                }

                # if ($debug) {
                #     write-host "To >$value<"
                # }    
                [System.Environment]::SetEnvironmentVariable($nameValuePair[0], $value)
            }
        }

        $loop = $false
    }
    else {
        $lastBackslash = $path.LastIndexOf("/")
        if ($lastBackslash -lt 4) {
            $loop = $false
            if ($debug) {
                write-output "Didn't find any .env file  "
            }
        }
        else {
            $path = $path.Substring(0, $lastBackslash)
        }
    }

} while ($loop)



``````