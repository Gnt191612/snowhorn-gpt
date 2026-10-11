param([switch]$Force)
$ErrorActionPreference = 'Stop'
$pluginRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path
$sourceDir = Join-Path $pluginRoot 'assets\pet'
$codexRoot = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
$targetDir = Join-Path $codexRoot 'pets\snowhorn-gpt'
$sourceJson = Join-Path $sourceDir 'pet.json'
$sourceSheet = Join-Path $sourceDir 'spritesheet.webp'
$targetJson = Join-Path $targetDir 'pet.json'
$targetSheet = Join-Path $targetDir 'spritesheet.webp'
if (-not (Test-Path -LiteralPath $sourceJson) -or -not (Test-Path -LiteralPath $sourceSheet)) { throw 'Bundled pet assets are missing.' }
if ((Test-Path -LiteralPath $targetDir) -and -not $Force) {
  $same = (Test-Path -LiteralPath $targetJson) -and (Test-Path -LiteralPath $targetSheet) -and ((Get-FileHash -Algorithm SHA256 -LiteralPath $sourceJson).Hash -eq (Get-FileHash -Algorithm SHA256 -LiteralPath $targetJson).Hash) -and ((Get-FileHash -Algorithm SHA256 -LiteralPath $sourceSheet).Hash -eq (Get-FileHash -Algorithm SHA256 -LiteralPath $targetSheet).Hash)
  if ($same) { Write-Output 'installed=true'; Write-Output 'status=already-current'; Write-Output 'spriteVersionNumber=2'; Write-Output 'width=1536'; Write-Output 'height=2288'; exit 0 }
  throw 'A different version already exists. Use -Force only after explicit confirmation.'
}
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
Copy-Item -LiteralPath $sourceJson -Destination $targetJson -Force
Copy-Item -LiteralPath $sourceSheet -Destination $targetSheet -Force
Write-Output 'installed=true'
Write-Output "path=$targetDir"
Write-Output 'spriteVersionNumber=2'
Write-Output 'width=1536'
Write-Output 'height=2288'
