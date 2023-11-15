import yaml
import re

# Function to extract variables from YARA rule
def extract_yara_variables(file_path):
    with open(file_path, 'r') as file:
        yara_content = file.read()

    # YARA rule format is: $<variable_name> = "<variable_value>"
    return re.findall(r'\$(\w+) = "([^"]+)"', yara_content)

# Function to extract variables from Lua source code
def extract_lua_variables(file_path):
    with open(file_path, 'r') as file:
        lua_code = file.read()

    # Extract variable names
    return re.findall(r'\b(?:local\s+)?(\w+)\s*=?', lua_code)

# Extract variables
yara_variables = extract_yara_variables('profile.yaml')  
lua_variables = extract_lua_variables('source_code.lua') 

# Convert to sets for comparison
yara_variable_names = set(name for name, _ in yara_variables)
lua_variable_names = set(lua_variables)

# Find common and missing variables
common_variables = yara_variable_names & lua_variable_names
missing_in_yara = lua_variable_names - yara_variable_names

# Report findings
print("Common Variables in Both YARA and Lua:")
for var in common_variables:
    print(var)

print("\nVariables in Lua Missing in YARA:")
for var in missing_in_yara:
    print(var)
