#########################################
#Author: Alexis Lebrun
#Tested on Zabbix 6.0
#
#Add to Zabbix Agent
# UserParameter=TaskSchedulerMonitoring[*],powershell -NoProfile -ExecutionPolicy Bypass -File <path to script> "$1" "$2"
#########################################

Import-Module WebAdministration

$ITEM = [string]$args[0]
$CHECK = [string]$args[1]
$CHECK = $CHECK.Insert(3, '\')

$CertAll=Get-ChildItem -Path Cert:\LocalMachine\My
$CertInUse=Get-Childitem -Path IIS:\SslBindings
$CertSame=Compare-Object -ReferenceObject $CertAll -DifferenceObject $CertInUse -Property ThumbPrint -IncludeEqual -ExcludeDifferent

switch ($ITEM) {
    "DiscoverCertificate" {
        write-host "{"
        write-host " `"data`":[`n"
        $idx= 1
        Foreach($Cert in $CertSame) {

            Foreach( $ChildCert in  Get-Childitem -path Cert:\LocalMachine\My\$($Cert.thumbprint)) {
                
                $ChildCertName = $ChildCert | Select-Object -ExpandProperty Subject

                if ($idx -lt $CertSame.count) {
                    $line= "{ `"{#CERTNAME}`" : `"" + $ChildCertName + "`" },"
                    Write-Host $line
                } elseif ($idx -ge $CertSame.count) {
                    $line= "{ `"{#CERTNAME}`" : `"" + $ChildCertName + "`" }"
                    Write-Host $line
                }

                $idx++
                
            }  
            
        }
        write-host
        write-host " ]"
        write-host "}"  
    }
}


switch ($ITEM) {
    "CheckDays" {
        Foreach($Cert in $CertAll | Where-Object {$_.Subject -match "$($CHECK)"}) {

            Foreach ($ChildItemCertDay in $Cert | Select-Object -Property @{n="ExpireInDays";e={($_.notafter - (Get-Date)).Days}}) {
            
                $ChildItemCertDayVar = $ChildItemCertDay | Select-Object -ExpandProperty ExpireInDays
                Write-Output $ChildItemCertDayVar
               
            }
        
        }
    }
}
