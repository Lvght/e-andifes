param (
    [boolean] $persistir = $false
)

$logo = "
____    ____ _  _ ___  _ ____ ____ ____ 
|___ __ |__| |\ | |  \ | |___ |___ [__  
|___    |  | | \| |__/ | |    |___ ___] 
"

Clear-Host
Write-Host $logo

if (!(Test-Path -Path schema)) {
    New-Item -ItemType Directory -Path schema
}

$sair = $false
$navegadorAberto = $false

Write-Host "Gerando o diagrama. Ele será aberto em seu navegador automaticamente quando estiver pronto."
Write-Host "`nPor favor, aguarde..."

if ($persistir -eq $true) {
    Write-Host "Para sair, pressione Ctrl+C."
}

Write-Host "`n`n"

while ($sair -eq $false) {
    docker run --rm -v "$(Get-Location)\schema:/output" `
        -v "$(Get-Location)\config\schemaspy.conf:/schemaspy.properties" `
        --network e-andifes_default schemaspy/schemaspy:latest 1> $null

    $t = Get-Date -Format "HH:mm:ss"
    $x = [char]::ConvertFromUtf32($(Get-Random -Minimum 0x1f600 -Maximum 0x1F64F))

    Write-Host "[${t}] ${x}"

    if ($navegadorAberto -eq $false) {
        $navegadorAberto = $true
        Start-Process -FilePath "schema\index.html"
    }

    $sair = ! $persistir
}
