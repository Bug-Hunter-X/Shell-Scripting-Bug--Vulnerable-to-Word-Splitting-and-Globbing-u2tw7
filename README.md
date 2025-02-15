# Shell Scripting Bug: Vulnerable to Word Splitting and Globbing

This repository demonstrates a subtle yet common bug in shell scripting involving word splitting and globbing.  The script attempts to process a file word by word, but fails if the file contains spaces or special characters in the words. This is due to the use of `$(cat ...)` which uses word splitting.  Additionally, unexpected globbing could occur.

## Bug Description
The `for` loop uses command substitution (`$(...)`) which first executes `cat "$file_to_process"`, then performs word splitting on the output.  Word splitting can lead to unexpected results when filenames or lines have spaces or special characters.

## How to reproduce
1. Create a file named `my_file.txt` with content like:
   ```
   This is a line with spaces.
   Another line with a special character:  &*
   ```
2. Run `bug.sh`
3. Observe unexpected behavior or errors.

## Solution
The solution uses `read` with `while` loop for safer word processing.  `read` avoids word splitting. 

## Lessons Learned
- Avoid using command substitution in loops when dealing with potentially unstructured input.
- Use the `read` command within a loop for safer and more robust file processing.
- Always quote your variables to prevent word splitting and globbing.