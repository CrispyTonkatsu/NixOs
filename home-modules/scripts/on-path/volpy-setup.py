#! /usr/bin/env python3

import argparse, os
from pathlib import Path
from zipfile import ZipFile

# Create the parser for an easier time dealing with the input arguments
parser = argparse.ArgumentParser(
    description='automatically setup a volper project')

default_path = str(Path.home()) + str('/digipen/CS330')

# Adding the arguments the parser should look for
_ = parser.add_argument('zip_path', type=str, help='The location of the zip with the given files for the project')
_ = parser.add_argument('-d','--destination', required=False, default=default_path, type=str, help='The location to create the folder and setup the project')

# Collecting the arguments
args = parser.parse_args()
zip_path = str(args.zip_path)
destination = str(args.destination)

# Processing the strings to create the folder
file_name = str(os.path.basename(zip_path))

# Checking that we are getting a zip file that exists
if(not file_name.endswith(".zip") or not os.path.isfile(zip_path)):
    print("zip path does not evaluate to existing zip file")
    exit()

folder_path = str(destination) + "/" + file_name.removesuffix(".zip")

# Actually setting up the environment
os.mkdir(folder_path)
ZipFile(zip_path).extractall(folder_path)

# Cloning the github template
