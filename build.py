import os
import sys
import shutil
from pathlib import Path

def main(directory):
    # Check if the directory exists
    if not os.path.exists(directory):
        print(f"Directory {directory} does not exist.")
        sys.exit(1)

    # Get the last part of the directory name and convert it to lowercase
    image_name = Path(directory).name.lower()

    print(f"Building Docker image from directory: {directory}")
    print(f"Docker image name: {image_name}")

    # Copy common_files to the target directory, overwriting if it exists
    common_files = './common_files'
    destination = os.path.join(directory, 'common_files')
    if os.path.exists(common_files):
        if os.path.exists(destination):
            shutil.rmtree(destination)
        shutil.copytree(common_files, destination)
        print(f"Copied common files from {common_files} to {directory}")
    else:
        print(f"Common files directory {common_files} does not exist.")
        sys.exit(1)

    # Build the Docker image
    try:
        os.chdir(directory)
        os.system(f'docker build --network host -t "sidaliu/{image_name}:latest" .')
    finally:
        os.chdir('..')  # Change back to the original directory

    if os.path.exists(destination):
        shutil.rmtree(destination)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python build.py <directory>")
        sys.exit(1)
    
    directory = sys.argv[1]
    main(directory)
