# ********************************
# *****  HASH MATCH CHECKER  *****
# ***** By Rich98            *****
# ********************************

# Get the hash and set the variable for file1
$PathFile1 = "<add path and filename>"
$HashFile1 = (Get-FileHash -Path $PathFile1 -Algorithm SHA256).Hash

# Get the hash and set the variable for file2
$PathFile2 = "<add path and filename>"
$HashFile2 = (Get-FileHash -Path $PathFile2 -Algorithm SHA256).Hash

# Compare the hashes
if ($HashFile1 -and $HashFile2) {
    if ($HashFile1 -eq $HashFile2) {
        Write-Output "INFO:  Hashes match."
    } else {
        Write-Error "ERROR: Hashes differ!"
    }
} else {
    Write-Error "ERROR: One or both hashes are missing!"
}

Write-Output $HashFile1
Write-Output $HashFile2
Pause
