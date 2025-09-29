#! /usr/bin/env python3

import argparse, os
from pathlib import Path

# Create the parser for an easier time dealing with the input arguments
parser = argparse.ArgumentParser(
    description='automatically setup a volper project')

# Adding the arguments the parser should look for
_ = parser.add_argument('zip_path', type=Path, help='The location of the zip with the given files for the project')
_ = parser.add_argument('-d','--destination', required=False, default='~/digipen/CS330', type=Path, help='The location to create the folder and setup the project')

# Collecting the arguments
args = parser.parse_args()

# Processing the strings to create the folder
folder_name = str(os.path.basename(args.zip_path))

# Checking that we are getting a zip
if(not folder_name.endswith(".zip")):
    print("zip path does not evaluate to zip file")
    exit()

folder_path = str(args.destination) + "/" + folder_name

print(folder_path)
