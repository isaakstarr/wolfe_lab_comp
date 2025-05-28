@echo off
:: Change directory to where the PDB files are located
cd /d "C:\Users\WolfeLab2\Desktop\docking\Compounds_test"

:: Loop through all PDB files in the current directory
for %%f in (*.pdb) do (
    python prepare_ligand4.py -l "%%f" -o "%%~nf.pdbqt"
)

@echo Finished processing all PDB files.
pause

