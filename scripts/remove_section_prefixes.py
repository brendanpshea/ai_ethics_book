import os
import re

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    new_lines = []
    changed = False
    
    # Matches "## Section X: " where X can be anything (or just "## Section: ")
    # Or specifically "## Section [number or letter]: "
    pattern = re.compile(r'^##\s+Section\s+.*?: *(.*)')
    
    for line in lines:
        match = pattern.match(line)
        if match:
            new_lines.append(f"## {match.group(1)}\n")
            changed = True
        else:
            new_lines.append(line)
            
    if changed:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)
        print(f"Updated {filepath}")

def main():
    target_dirs = ['chapters', 'templates']
    
    for d in target_dirs:
        if not os.path.exists(d):
            continue
        for root, _, files in os.walk(d):
            for file in files:
                if file.endswith('.md'):
                    process_file(os.path.join(root, file))

if __name__ == '__main__':
    main()
