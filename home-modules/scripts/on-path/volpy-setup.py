#! /usr/bin/env python3
import argparse, os, subprocess
from pathlib import Path
from zipfile import ZipFile

# Create the parser for an easier time dealing with the input arguments
parser = argparse.ArgumentParser(
    description='automatically setup a volper project')

class_name = "CS330"

default_path = str(Path.home()) + str('/digipen') + "/" + class_name

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

# Cloning the github template
repo_name = class_name + "-" + file_name.removesuffix(".zip").removesuffix("-files")

repo_creation_output = subprocess.run(["gh","repo", "create", repo_name, "--private", "-p", "CrispyTonkatsu/volpy-template"])

if(repo_creation_output.returncode != 0):
    exit()

repo_cloning_output = subprocess.run(["gh", "repo", "clone", repo_name, folder_path])

if(repo_cloning_output.returncode != 0):
    exit()

repo_pull_output = subprocess.run(["git", "-C", folder_path, "pull"])

# Actually placing the files there
ZipFile(zip_path).extractall(folder_path)

# TODO: Add the cmake setup steps
