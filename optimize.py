import re

def optimize_code(source):
    # Remove comments
    source = re.sub(r'#.*', '', source)
    # Remove leading and trailing whitespace from each line
    source = '\n'.join(line.strip() for line in source.splitlines())
    # Remove multiple empty lines
    source = re.sub(r'\n\s*\n', '\n', source)
    return source

def optimize_file(input_path, output_path):
    with open(input_path, 'r', encoding='utf-8') as file:
        source = file.read()

    optimized_source = optimize_code(source)

    with open(output_path, 'w', encoding='utf-8') as file:
        file.write(optimized_source)

    print(f"Optimized code written to {output_path}")

# Example usage
input_file = 'example.py'  # Replace with the path to your Python file
output_file = 'example_optimized.py'  # Output file path
optimize_file(input_file, output_file)
