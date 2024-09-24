
# Create an log file from some parameters
# Define the name of the logs directory
$logs = "logs"
# Get the current script's name without the .ps1 extension
# Uses .NET class in PowerShell - System.IO.Path amd :GetFileNameWithoutExtension($MyInvocation.MyCommand.Name to remove the .ps1 extension 
$scriptName = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)
# Define the output file path with the same name as the script
# $PSScriptRoot is an automatic variable in PowerShell that contains the full filesystem path of the directory where the currently running script is located. 
$date = Get-Date -Format "dd-mm-yyyy_HH-mm-ss"
$outputFile = "$PSScriptRoot\$logs\$scriptName.$date.log"

# Example command to write output to the file
"Script output goes here" | Out-File -FilePath $outputFile # -Append


# When ready let's turn it into a function

function EstablishIfAdmin {

# Let's do something
# Let's check whether the current user has admin rights 
$currentUser = [Security.Principal.WindowsIdentity]::GetCurrent() 
Write-Output $currentUser | Out-File -FilePath $outputFile -Append

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal($currentUser)
Write-Output $currentPrincipal | Out-File -FilePath $outputFile -Append
$adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

echo $adminRole

 if ($currentPrincipal.IsInRole($adminRole)) {
        Write-Output "The user has administrative rights." | Out-File -FilePath $outputFile -Append
        return $true
 } else {
        Write-Output "The user does not have administrative rights." | Out-File -FilePath $outputFile -Append
        return $false
 }
}

# call EstablishIfAdmin fuunction
# Write-Host "Calling the function EstablishIfAdmin"
EstablishIfAdmin
Write-Host "The script has run"








# Example Error tracking - For further thought

# try {
    # Code that might generate an error
    #$result = Get-Content -Path "C:\nonexistentfile.txt"
#    $result = Get-Content -Path Base_Script2.ps1
#    Write-Host "File content: $result" # | Out-File -FilePath $outputFile -Append
#}
#catch {
    # Handle the error
#    Write-Host "An error occurred: $_" # | Out-File -FilePath $outputFile -Append
#}
#finally {
    # Code that runs regardless of whether an error occurred
#    Write-Host "Cleaning up resources..." # | Out-File -FilePath $outputFile -Append
#}





# Example of a while true loop
# $counter = 10

# while ($true) {
    # Display the current counter value
#    Write-Output "Countdown: $counter"

    # Decrease the counter
#    $counter--

    # Exit the loop when the counter reaches 0
#    if ($counter -eq 0) {
#        Write-Output "Countdown complete!"
#        break
#    }

    # Pause for 1 second between each iteration
#    Start-Sleep -Seconds 1
#}

# Write-Output "The loop has ended."

