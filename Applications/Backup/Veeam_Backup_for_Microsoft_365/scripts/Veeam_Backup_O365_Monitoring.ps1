# Pobranie jobów
$Jobs = Get-VBOJob
$CopyJobs = Get-VBOCopyJob

# Połączenie obu kolekcji w jedną
$AllJobs = @()

$AllJobs += $Jobs | ForEach-Object {
    [PSCustomObject]@{
        "JOB_ID"     = $_.Id
        "JOB_NAME"   = $_.Name
        "JOB_STATUS" = $_.LastStatus.ToString()
    }
}

$AllJobs += $CopyJobs | ForEach-Object {
    [PSCustomObject]@{
        "JOB_ID"     = $_.Id
        "JOB_NAME"   = $_.Name
        "JOB_STATUS" = $_.LastStatus.ToString()
    }
}

# Jeden wspólny JSON
$AllJobs | ConvertTo-Json -Depth 3