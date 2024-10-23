import sys

def contains_date(line):
    # Check if the line contains a date in DD/MM/YYYY format
    for i in range(len(line) - 9):
        if line[i:i+2].isdigit() and line[i+2] == '/' and \
           line[i+3:i+5].isdigit() and line[i+5] == '/' and \
           line[i+6:i+10].isdigit():
            return True
    return False

def remove_dated_comments(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        in_block_comment = False
        
        for line in infile:
            stripped_line = line.strip()

            # Handle block comments
            if '/*' in stripped_line:
                in_block_comment = True
                outfile.write(line)  # Write the opening part of the block comment
                continue  # Continue to process the next lines inside the block

            if '*/' in stripped_line and in_block_comment:
                in_block_comment = False
                outfile.write(line)  # Write the closing part of the block comment
                continue

            if in_block_comment:
                if contains_date(stripped_line):
                    continue  # Skip lines with dates within the block comment
                else:
                    outfile.write(line)  # Write non-dated lines within the block comment
            else:
                # Handle single-line comments
                if stripped_line.startswith("//"):
                    if contains_date(stripped_line):
                        continue  # Skip this comment if it contains a date
                    else:
                        outfile.write(line)  # Write non-dated comments
                else:
                    # Write non-comment lines
                    outfile.write(line)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python dcom_rm.py inputC.cpp outputC_rm.cpp")
    else:
        input_file = sys.argv[1]
        output_file = sys.argv[2]
        remove_dated_comments(input_file, output_file)
