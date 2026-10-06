# Instala las skills en ~/.claude/skills (Windows / PowerShell)
$destino = Join-Path $HOME ".claude\skills"
$reserva = Join-Path $HOME ".claude\reserva"
New-Item -ItemType Directory -Force $destino, $reserva | Out-Null

Get-ChildItem (Join-Path $PSScriptRoot "skills") -Directory | ForEach-Object {
    Copy-Item $_.FullName $destino -Recurse -Force
    Write-Host "Instalada: $($_.Name)"
}

Write-Host ""
Write-Host "Listo. Falta (a mano, una vez):"
Write-Host "  1. Pegar plantillas\CLAUDE.md al final de $HOME\.claude\CLAUDE.md"
Write-Host "  2. Sumar el bloque 'env' de plantillas\settings.json a $HOME\.claude\settings.json"
Write-Host "  3. Abrir Claude Code y pedir: /context-budget"
