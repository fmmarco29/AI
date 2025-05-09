@echo off
REM Este script actualizará tu repositorio en GitHub.

cd /d "%~dp0" || (echo Error: No se pudo cambiar al directorio y salir & exit /b)

REM --- Hacer pull desde GitHub para traer cambios remotos ---
echo --- Haciendo pull desde GitHub...
git pull origin main || (echo Error: Fallo el pull desde GitHub & exit /b)

REM --- Añadir todos los archivos nuevos/modificados/eliminados ---
echo --- Añadiendo cambios al repositorio...
git add -A || (echo Error: Fallo al añadir los archivos & exit /b)

REM --- Hacer commit con un mensaje automático basado en la fecha y hora ---
for /f %%a in ('wmic os get localdatetime ^| find "."') do set datetime=%%a
set timestamp=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%
set commitmsg=Auto commit %timestamp%

echo --- Haciendo commit con mensaje: %commitmsg%
git commit -m "%commitmsg%" || (echo Error: Fallo al hacer commit & exit /b)

REM --- Subir los cambios a GitHub ---
echo --- Subiendo cambios a GitHub...
git push origin main || (echo Error: Fallo al hacer push a GitHub & exit /b)

echo --- ¡Listo! Los cambios han sido subidos correctamente.
