import re

def extract_yara_variable_values(file_content):
    # Extracting variable values from the strings section
    return set(re.findall(r'\$[a-zA-Z0-9_]+ = "([^"]+)"', file_content))

def compare_variable_values(file1_content, file2_content):
    values_file1 = extract_yara_variable_values(file1_content)
    values_file2 = extract_yara_variable_values(file2_content)

    # Find common and different values
    common_values = values_file1 & values_file2
    different_values_file1 = values_file1 - values_file2
    different_values_file2 = values_file2 - values_file1

    return common_values, different_values_file1, different_values_file2

def format_output(section_title, values):
    output = f"{section_title}:\n"
    for value in sorted(values):
        output += f"- {value}\n"
    return output

# Read the YARA file contents
with open('profile.yara', 'r') as file:
    profile_yara_content = file.read()

with open('src_code.yara', 'r') as file:
    src_code_yara_content = file.read()

# Compare variable values
common_vals, diff_vals_profile, diff_vals_src_code = compare_variable_values(profile_yara_content, src_code_yara_content)

# Format and print output
print(format_output("Common Variable Values", common_vals))
print(format_output("Variable Values in Profile YARA but not in Source Code", diff_vals_profile))
print(format_output("Variable Values in Source Code YARA but not in Profile", diff_vals_src_code))
