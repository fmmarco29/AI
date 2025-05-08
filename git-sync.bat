@echo off
REM Sincroniza repositorio con GitHub y crea backup ZIP excluyendo carpetas innecesarias

cd /d "%~dp0"

echo --- Haciendo pull para traer cambios remotos...
git pull origin main

echo --- Añadiendo todos los cambios...
git add -A

REM Obtener fecha y hora para mensaje y backup
for /f %%a in ('wmic os get localdatetime ^| find "."') do set datetime=%%a
set timestamp=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%
set commitmsg=Auto commit %timestamp%

echo --- Haciendo commit con mensaje: %commitmsg%
git commit -m "%commitmsg%"

REM Crear carpeta backups si no existe
if not exist backups (
    mkdir backups
)

REM Crear backup excluyendo carpetas no deseadas
echo --- Creando backup ZIP sin carpetas ignoradas...
powershell -Command ^
$ExcludeDirs = @('.git', 'venv', '__pycache__', 'backups'); ^
$Items = Get-ChildItem -Path "." -Recurse -File | Where-Object { ^
    foreach ($ex in $ExcludeDirs) { if ($_.FullName -like "*\$ex\*") { return $false } } ^
    return $true ^
}; ^
$Items | Compress-Archive -DestinationPath "backups\backup_%timestamp%.zip" -Force

echo --- Subiendo a GitHub...
git push origin main

echo --- ¡Listo! Cambios subidos y backup limpio creado en la carpeta "backups".
pause

