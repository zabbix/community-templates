$data = Get-FsrmQuota | ForEach-Object {
    [PSCustomObject]@{
        "{#QUOTANAME}" = Split-Path $_.Path -Leaf
        "{#QUOTAPATH}" = $_.Path
    }
}

@{
    data = $data
} | ConvertTo-Json -Compress