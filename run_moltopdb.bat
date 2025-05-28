@echo off
setlocal

:: Change this to the path of your folder
set TARGET_FOLDER=C:\Users\WolfeLab2\Desktop\docking\Compounds_test

:: Run the Python script
"C:\Users\WolfeLab2\AppData\Local\Programs\Python\Python313\python.exe" convert_mol_to_pdb.py "%TARGET_FOLDER%"

pause
