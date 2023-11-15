import yaml
import re

# Function to read and parse the YAML file
def read_yaml_file(file_path):
    with open(file_path, 'r') as file:
        return yaml.safe_load(file)

# Function to extract key-value pairs from the YAML content
def extract_yaml_attributes(yaml_content):
    attributes = []
    if isinstance(yaml_content, dict):
        for key, value in yaml_content.items():
            if isinstance(value, (dict, list)):
                attributes.extend(extract_yaml_attributes(value))
            else:
                attributes.append((key, str(value)))
    elif isinstance(yaml_content, list):
        for item in yaml_content:
            if isinstance(item, (dict, list)):
                attributes.extend(extract_yaml_attributes(item))
    return attributes

# Function to create a YARA rule from the list of YAML attributes
def create_yara_rule_from_attributes(attributes, rule_name="SmartThingsEdgeDriverProfile"):
    strings_section = "\n".join(
        f'        $var_{i} = "{value}"' 
        for i, (key, value) in enumerate(attributes)
    )
    rule = f"""
rule {rule_name}
{{
    meta:
        description = "YARA rule to match SmartThings Edge Driver Profile based on YAML attributes"
        author = "Huan Bui"

    strings:
{strings_section}

    condition:
        any of them
}}
"""
    return rule

# Paths to the files
yaml_file_path = 'profile.yaml'  # Replace with your actual YAML file path

# Read the YAML file content
yaml_content = read_yaml_file(yaml_file_path)

# Extract attributes from the YAML content
yaml_attributes = extract_yaml_attributes(yaml_content)

# Create the YARA rule with all the extracted YAML attributes
yara_rule_yaml_attributes = create_yara_rule_from_attributes(yaml_attributes)

# Save the YARA rule to a file
yara_rule_file_path = 'profile.yara'
with open(yara_rule_file_path, 'w') as file:
    file.write(yara_rule_yaml_attributes)

# Output the path to the saved YARA rule
print(f"The YARA rule has been saved to {yara_rule_file_path}")
