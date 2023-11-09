import re
import yaml

# Function to read the Lua file and extract the content
def read_lua_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Function to extract potential variable names, function names, and unique identifiers
def extract_lua_identifiers(lua_source):
    pattern = re.compile(r'\b(?:local\s+)?(\w+)\s*(?:=|\()')
    matches = re.findall(pattern, lua_source)
    unique_matches = sorted(set(matches), key=lambda x: matches.index(x))
    return unique_matches

# Function to create a YARA rule from the list of Lua identifiers
def create_yara_rule_from_identifiers(identifiers, rule_name="SmartThingsEdgeDriverLua"):
    strings_section = "\n".join(
        f'        ${identifier}_{i} = "{identifier}"' for i, identifier in enumerate(identifiers)
    )
    rule = f"""
rule {rule_name}
{{
    meta:
        description = "YARA rule to match SmartThings Edge Driver Lua source code based on variable identifiers"
        author = "Huan Bui"

    strings:
{strings_section}

    condition:
        any of them
}}
"""
    return rule

# Paths to the files
lua_file_path = 'normal-presenceSensor-v1.lua'

# Read the Lua file content
lua_source_code = read_lua_file(lua_file_path)

# Extract identifiers from the Lua source code
lua_identifiers = extract_lua_identifiers(lua_source_code)

# Create the YARA rule with all the extracted Lua identifiers
yara_rule_lua_identifiers = create_yara_rule_from_identifiers(lua_identifiers)

# Save the YARA rule to a file
yara_rule_file_path = 'src_code.yara'
with open(yara_rule_file_path, 'w') as file:
    file.write(yara_rule_lua_identifiers)

# Output the path to the saved YARA rule
print(f"The YARA rule has been saved to {yara_rule_file_path}")
