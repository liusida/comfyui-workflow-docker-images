import json
import sys

def main(workflow_file):
    # Load the JSON data
    print(f"Load workflow: {workflow_file}")
    try:
        with open(workflow_file, 'r') as f:
            data = json.load(f)
    except FileNotFoundError:
        print(f"Error: The file {workflow_file} does not exist.")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"Error: The file {workflow_file} is not a valid JSON file.")
        sys.exit(1)

    # Create the JavaScript output
    output = 'export const defaultGraph = '

    # Dump the JSON data as a formatted string
    output += json.dumps(data, indent=4)

    # Add the closing semicolon
    output += ';\n'

    # Save to a JavaScript file
    with open('defaultGraph.js', 'w') as f:
        f.write(output)

    print("Conversion complete. The JavaScript file has been created.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python workflow_2_defaultGraph.py <workflow_file>")
        sys.exit(1)
    
    workflow_file = sys.argv[1]
    main(workflow_file)
