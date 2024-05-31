import os
import sys
from pathlib import Path
import subprocess
import argparse

def clean_path(path):
    """
    Cleans the given path by removing leading './' or '.\'.
    """
    return path

def main(args):
    workflow_path = Path(args.workflow).as_posix()
    service_name = args.service.lstrip("./\\").rstrip("\\").lower()
    port = args.port

    # Convert service name to lowercase for the Docker image name
    docker_image = f"sidaliu/{service_name}"
    
    # Define the Docker run command
    docker_command = ' '.join([
        "docker", "run", "-it",
        "--rm",
        "--name", service_name,
        "-p", f"{port}:{port}",
        "-e", f"PORT={port}",
        "-e", f"WORKFLOW={workflow_path}",
        "--gpus", "all",
        "-v", f"{os.getcwd()}/models:/ComfyUI/models",
        "-v", f"{os.getcwd()}/input:/ComfyUI/input",
        "-v", f"{os.getcwd()}/output:/ComfyUI/output",
        "-v", f"{os.getcwd()}/workflows:/ComfyUI/workflows",
        docker_image
    ])
    
    # Print the Docker command for debugging purposes
    print(f"Running command: {docker_command}")
    
    os.system(docker_command)
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run a Docker container for a specified service and workflow.")
    parser.add_argument("--workflow", type=str, help="Path to the workflow file.")
    parser.add_argument("--service", type=str, help="Name of the Docker service.")
    parser.add_argument("--port", type=int, default=8188, help="Port number to be used by the Docker container. Default is 8188.")

    args = parser.parse_args()
    
    main(args)
