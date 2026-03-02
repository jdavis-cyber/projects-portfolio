#!/usr/bin/env python3
import sys
import re
import os

def validate_spec(file_path):
    if not os.path.exists(file_path):
        print(f"ERROR: Spec file not found at {file_path}")
        return False

    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    errors = []
    lines = content.split('\n')
    
    # Check for empty brackets [ ] or [inject ...] or placeholder text
    bracket_pattern = re.compile(r'\[(.*?)\]')
    
    for line_num, line in enumerate(lines, 1):
        # Ignore markdown link syntax [text](url) checking for unfilled brackets
        # but match things like [ ], [Inject...], [Date]
        
        # Check for explicitly empty brackets (like unfilled checkboxes or empty fields)
        if '[ ]' in line and not line.strip().startswith('- [ ]'): 
            # Allow checklist '- [ ]' but warn on inline empty brackets
            errors.append(f"Line {line_num}: Contains empty brackets '[ ]', please provide explicit values.")
            
        # Check for placeholder keywords inside brackets
        matches = bracket_pattern.finditer(line)
        for match in matches:
            inner_text = match.group(1).lower().strip()
            # If the bracket text contains placeholder-like terms
            if any(term in inner_text for term in ['inject', 'date', 'e.g.', 'draft', 'template', 'tbd', 'todo']):
                # Special case to ignore the template header itself if still present
                if 'template' in inner_text and 'System Specification Document' in lines[0]:
                    pass # Relaxed rule for the header if it's the literal title
                else:
                    errors.append(f"Line {line_num}: Contains placeholder text -> '[{match.group(1)}]'")
        
        # Check for TBD or TODO outside brackets
        if 'TBD' in line or 'TODO' in line:
            errors.append(f"Line {line_num}: Contains 'TBD' or 'TODO'. Explicit values required.")

    if errors:
        print(f"\n--- SPEC VALIDATION FAILED for {file_path} ---")
        for error in errors:
            print(error)
        print("\nPlease resolve these placeholders before proceeding to Lock 1.\n")
        return False

    print(f"\n+++ SPEC VALIDATION PASSED for {file_path} +++\n")
    return True

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python validate_spec.py <path/to/system_spec.md>")
        sys.exit(1)
        
    target_file = sys.argv[1]
    success = validate_spec(target_file)
    sys.exit(0 if success else 1)
