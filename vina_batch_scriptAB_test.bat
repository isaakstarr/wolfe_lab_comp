@echo off
setlocal enabledelayedexpansion

for %%f in ("C:\Users\WolfeLab2\Desktop\docking\Compounds1\*.pdbqt") do (
    echo Processing ligand %%f
    set "outname=AB_%%~nf"
    mkdir "C:\Users\WolfeLab2\Desktop\docking\Output\!outname!"
    "C:\Users\WolfeLab2\Desktop\Pyridine docking\vina.exe" --config Config.txt --ligand "%%f" --out "C:\Users\WolfeLab2\Desktop\docking\Output1\!outname!\!outname!.pdbqt" --log "C:\Users\WolfeLab2\Desktop\docking\Output\!outname!\!outname!.log"
)

echo All ligands processed.
pause

