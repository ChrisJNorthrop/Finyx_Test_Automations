# Create a log file from some parameters
# Define the name of the logs directory
$logs = "logs"

# Get the current script's name without the .ps1 extension
$scriptName = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)

# Define the output file path with the same name as the script
$date = Get-Date -Format "dd-MM-yyyy_HH-mm-ss"  # Ensure valid date format for filenames
$logDirectory = Join-Path -Path $PSScriptRoot -ChildPath $logs

# Ensure the logs directory exists
if (-not (Test-Path -Path $logDirectory)) {
    New-Item -ItemType Directory -Path $logDirectory
}

# Define the full log file path
$outputFile = Join-Path -Path $logDirectory -ChildPath "$scriptName.$date.log"

# Example command to write output to the file
"Script output goes here" | Out-File -FilePath $outputFile -Append

# Example of a while-true loop
$counter = 5

while ($true) {
    # Display the current counter value
    Write-Output "Countdown: $counter"

    # Decrease the counter
    $counter--

    # Exit the loop when the counter reaches 0
    if ($counter -eq 0) {
        Write-Output "Countdown complete!"
        break
    }

    # Pause for 1 second between each iteration
    Start-Sleep -Seconds 1
}

Write-Output "The loop has ended."
