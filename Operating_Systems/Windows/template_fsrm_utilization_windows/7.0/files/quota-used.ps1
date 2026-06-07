param($QuotaName)

$q = Get-FsrmQuota | Where-Object {
    (Split-Path $_.Path -Leaf) -eq $QuotaName
}

if ($q) {
    $value = [math]::Round(($q.Usage / $q.Size) * 100, 2)
    $value.ToString([System.Globalization.CultureInfo]::InvariantCulture)
}
else {
    0
}