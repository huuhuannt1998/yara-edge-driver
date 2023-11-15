import re

# Function to read the source code file and extract the content
def read_source_code(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Function to extract potential variable names, function names, and unique identifiers
def extract_source_code_identifiers(source_code):
    pattern = re.compile(r'\b(?:local\s+)?(\w+)\s*=?')
    matches = re.findall(pattern, source_code)
    unique_matches = sorted(set(matches), key=lambda x: matches.index(x))
    return unique_matches

# Function to create a YARA rule from the list of identifiers
def create_yara_rule_from_identifiers(identifiers, rule_name="SmartThingsEdgeDriverSourceCode"):
    strings_section = "\n".join(
        f'        $var_{i} = "{identifier}"' 
        for i, identifier in enumerate(identifiers)
    )
    rule = f"""
rule {rule_name}
{{
    meta:
        description = "YARA rule to match SmartThings Edge Driver Source Code based on extracted identifiers"
        author = "Huan Bui"

    strings:
{strings_section}

    condition:
        any of them
}}
"""
    return rule

# Paths to the files
source_code_file_path = 'source_code.lua'  # Replace with your actual file path

# Read the source code file content
source_code = read_source_code(source_code_file_path)

# Extract identifiers from the source code
source_code_identifiers = extract_source_code_identifiers(source_code)

# Create the YARA rule with all the extracted identifiers
yara_rule_source_code = create_yara_rule_from_identifiers(source_code_identifiers)

# Save the YARA rule to a file
yara_rule_file_path = 'src_code.yara'
with open(yara_rule_file_path, 'w') as file:
    file.write(yara_rule_source_code)

# Output the path to the saved YARA rule
print(f"The YARA rule has been saved to {yara_rule_file_path}")
