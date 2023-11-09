import yaml

def extract_attributes(yaml_content):
    """
    Recursively extract key-value pairs from a nested dictionary or list.

    :param yaml_content: The YAML content to extract attributes from.
    :return: A list of tuples containing the key-value pairs.
    """
    attributes = []

    if isinstance(yaml_content, dict):
        for key, value in yaml_content.items():
            # Include the key itself
            attributes.append((key, str(key)))
            # If the value is a dictionary or list, recurse
            if isinstance(value, (dict, list)):
                attributes.extend(extract_attributes(value))
            else:
                # If the value is a string or number, include it as well
                attributes.append((key, str(value)))
    elif isinstance(yaml_content, list):
        for item in yaml_content:
            # If the item is a dictionary or list, recurse
            if isinstance(item, (dict, list)):
                attributes.extend(extract_attributes(item))

    return attributes

def create_yara_rule(attributes, rule_name="YAMLEdgeDriverProfile"):
    """
    Create a YARA rule based on extracted attributes.

    :param attributes: A list of tuples with key-value pairs to be included in the rule.
    :param rule_name: The name of the YARA rule.
    :return: A string containing the YARA rule.
    """
    strings_section = "\n".join(
        f'        ${key}_{i} = "{value}"' for i, (key, value) in enumerate(attributes)
    )
    
    rule = f"""
rule {rule_name}
{{
    meta:
        description = "YARA rule to match attributes in a YAML configuration"
        author = "Huan Bui"

    strings:
{strings_section}

    condition:
        any of them
}}
"""
    return rule

# Provide the path to the YAML file
yaml_file_path = 'normal-contactSensor-v1.yaml'  # Replace with the actual file path

# Read the YAML content from the file
with open(yaml_file_path, 'r') as file:
    yaml_content = yaml.safe_load(file)

# Extract attributes from the YAML content
attributes = extract_attributes(yaml_content)

# Create the YARA rule with the extracted attributes
yara_rule = create_yara_rule(attributes)

# Output the YARA rule to a file
yara_rule_path = 'profile.yara'  # Replace with the desired output file path
with open(yara_rule_path, 'w') as file:
    file.write(yara_rule)

print(f"The YARA rule has been written to {yara_rule_path}")
