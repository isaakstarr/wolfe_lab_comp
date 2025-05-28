#!/bin/bash

# Directory containing the .pdbqt files
directory=$(pwd)

ligand_directory="$directory/Compounds_test_4_ser5"

# Path to the receptor file (make sure this path is correct)
receptor="$directory/input.pdbqt"

# Output directory where subdirectories will be created for each ligand
output_dir="$directory/GNINA_output_test_4_ser5"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Change to the specified directory
cd "$ligand_directory" || exit

conf="$directory/Config.txt"

# Loop through all .pdbqt files in the directory
for ligand in *.pdbqt; do
    # Extract the base name of the ligand file (without extension)
    base_name=$(basename "$ligand" .pdbqt)

    # Create a subdirectory for the current ligand
    ligand_output_dir="$output_dir/$base_name"
    mkdir -p "$ligand_output_dir"

    # Define output file paths
    output_file="$ligand_output_dir/${base_name}_out.pdbqt"
    log_file="$ligand_output_dir/${base_name}_log.txt"

    # Run Vina with explicit parameters
    sudo LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/wolfelab2/torch-env/lib/python3.12/site-packages/torch/lib gnina --receptor "$receptor" --ligand "$ligand" --out "$output_file" --log "$log_file" --config "$conf" --pose_sort_order energy

    echo "Docked $ligand, results saved to $ligand_output_dir"
done
