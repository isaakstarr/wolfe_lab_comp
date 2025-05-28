import os
import sys
from rdkit import Chem
from rdkit.Chem import AllChem

def minimize_and_convert_mol_to_pdb(folder_path):
    if not os.path.isdir(folder_path):
        print(f"Invalid folder path: {folder_path}")
        return

    for filename in os.listdir(folder_path):
        if not filename.lower().endswith(".mol"):
            continue

        mol_path = os.path.join(folder_path, filename)
        base_name = os.path.splitext(filename)[0]
        pdb_path = os.path.join(folder_path, base_name + ".pdb")

        # Load the MOL file
        mol = Chem.MolFromMolFile(mol_path, removeHs=False)
        if mol is None:
            print(f"Failed to load: {filename}")
            continue

        # Add hydrogens
        mol = Chem.AddHs(mol)

        # Generate 3D coordinates
        if AllChem.EmbedMolecule(mol, AllChem.ETKDG()) != 0:
            print(f"3D embedding failed: {filename}")
            continue

        # Try MMFF minimization
        if AllChem.MMFFHasAllMoleculeParams(mol):
            AllChem.MMFFOptimizeMolecule(mol)
            print(f"Minimized with MMFF: {filename}")
        else:
            print(f"Falling back to UFF for: {filename}")
            AllChem.UFFOptimizeMolecule(mol)

        # Write the PDB file
        Chem.MolToPDBFile(mol, pdb_path)
        print(f"Saved: {pdb_path}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python convert_mol_to_pdb.py <folder_path>")
    else:
        minimize_and_convert_mol_to_pdb(sys.argv[1])
