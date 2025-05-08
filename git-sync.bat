@echo off
REM Sincroniza repositorio con GitHub y crea un backup ZIP excluyendo carpetas innecesarias

cd /d "%~dp0"

REM --- Asegurarse de estar en la rama correcta (main o master) ---
echo --- Cambiando a la rama 'main'...
git checkout main

REM --- Hacer pull para obtener los cambios más recientes de GitHub ---
echo --- Haciendo pull desde GitHub...
git pull origin main

REM --- Añadir todos los archivos nuevos/modificados ---
echo --- Añadiendo todos los cambios...
git add -A

REM --- Obtener fecha y hora para el mensaje del commit ---
for /f %%a in ('wmic os get localdatetime ^| find "."') do set datetime=%%a
set timestamp=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%
set commitmsg=Auto commit %timestamp%

REM --- Realizar el commit ---
echo --- Haciendo commit con mensaje: %commitmsg%
git commit -m "%commitmsg%"

REM --- Crear carpeta "backups" si no existe ---
if not exist backups (
    mkdir backups
)

REM --- Crear el archivo ZIP, excluyendo carpetas no deseadas ---
echo --- Creando backup ZIP sin carpetas .git, venv, __pycache__...

powershell -Command ^
    $exclude = @('.git', 'venv', '__pycache__'); ^
    $files = Get-ChildItem -Recurse | Where-Object { ^
        $exclude -notcontains $_.Name -and $_.PSIsContainer -eq $false; ^
    }; ^
    $files | Compress-Archive -DestinationPath "backups\backup_%timestamp%.zip" -Force

REM --- Subir los cambios al repositorio de GitHub ---
echo --- Subiendo los cambios a GitHub...
git push origin main

REM --- Confirmar que todo se completó correctamente ---
echo --- ¡Listo! Cambios subidos y backup creado en la carpeta "backups".
pause
