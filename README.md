# wolfe_lab_comp
This GitHub compository contains code used in the pyridine project under Dr. Amanda Wolfe 

# Discription of files: 
# cdxmltomol.vbs (windows) -- 
Converts .cdxml files (saved from ChemDraw) into .mol files. The folder path will need to be changed in this code in order to be run; however, this code is not run from this file. 
# run_cdxmltomol.bat (windows) -- 
Runs .vbs file in order to avoid popups. There is no folder path in this code that needs to be changed in order to run. 
# convert_mol_to_pdb.py (windows) -- 
Hands conversion of the .mol files to .pdb files. This code is not run from this file. 
# run_moltopdb.bat (windows) -- 
Runs the code from the convert_mol_to_pdb.py file. The folder path needs to be specified in this file. 
# prepareligand4.py (windows) -- 
Takes care of the conversion from the .pdb file format to the .pdbqt file format. This code is not run from this file and does not need to be changed. 
# run_pdbtopdbqt.bat (windows) -- 
Runs the prepareligand4.py code. The folder path needs to be specified in this file. 

General notes for the above code 
- .bat and their respective code files need to be in the same folder in order to run properly 
- The input and output folder path is the same in all the code files, thus it only needs one input and output
- This code avoids issues of non-existant bonds being formed during .pdbqt conversion due to coordinate proximity
- This code uses MMFF energy minimization on the input molecules during the mol_to_pdb conversion step 

# vina_batch_scriptAB_test.bat (windows) -- 
Does a batch run for Vina of a group of compounds in the .pdbqt format in a folder. In this code, an input folder needs to be specified and an output folder needs to be specified three times (for the creation of the output folder, for the .pdbqt output, and for the .log output). If not specified, it will make its own folder in a random location. Additionally, the folder location of vina.exe needs to be specified in order for the batch to run. 

# gnina_batch.sh (linux) -- 
Does a batch run for Gnina of a group of compounds in the .pdbqt format in a folder. In this code, the name of the input folder needs to be specified and a name of an output folder (which it will create) needs to be specified. This file needs to be in the same linux directory as the input folder. 
