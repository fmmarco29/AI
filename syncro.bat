@echo off
REM Este script eliminará los archivos conflictivos y sincronizará el repositorio con GitHub.

REM Cambiar al directorio del proyecto
cd /d "%~dp0"

REM --- Eliminar los archivos conflictivos ---
echo --- Eliminando archivos conflictivos ---
git rm git-sync.bat
git rm .ipynb_checkpoints/RAG_con_PDF_o_Web-checkpoint.ipynb
git rm "RAG_con_PDF_o_Web - copia.ipynb"

REM --- Agregar los cambios al staging ---
echo --- Agregando cambios al staging ---
git add .

REM --- Hacer commit ---
echo --- Realizando commit de las eliminaciones ---
git commit -m "Eliminando archivos conflictivos"

REM --- Sincronizar con el repositorio remoto ---
echo --- Sincronizando con el repositorio remoto ---
git push origin main

echo --- ¡Sincronización completada! ---
pause
