import re

# Function to read a YARA file and extract its strings
def read_yara_strings(file_path):
    with open(file_path, 'r') as file:
        yara_content = file.read()

    # Extracting strings: Format assumed as $<string_name> = "<string_value>"
    strings = re.findall(r'\$(\w+) = "([^"]+)"', yara_content)
    return {name: value for name, value in strings}

# Function to compare two YARA files
def compare_yara_files(file1_path, file2_path):
    yara1_strings = read_yara_strings(file1_path)
    yara2_strings = read_yara_strings(file2_path)

    # Find common and unique strings
    common_strings = {k: v for k, v in yara1_strings.items() if k in yara2_strings and yara1_strings[k] == yara2_strings[k]}
    unique_to_yara1 = {k: v for k, v in yara1_strings.items() if k not in yara2_strings}
    unique_to_yara2 = {k: v for k, v in yara2_strings.items() if k not in yara1_strings}

    return common_strings, unique_to_yara1, unique_to_yara2

# Replace these with your actual YARA file paths
yara_file1_path = 'profile.yara'
yara_file2_path = 'src_code.yara'

# Compare the YARA files
common, unique_to_file1, unique_to_file2 = compare_yara_files(yara_file1_path, yara_file2_path)

# Display the results
print("Common Strings:")
for name, value in common.items():
    print(f"{name}: {value}")

print("\nUnique to File 1:")
for name, value in unique_to_file1.items():
    print(f"{name}: {value}")

print("\nUnique to File 2:")
for name, value in unique_to_file2.items():
    print(f"{name}: {value}")
