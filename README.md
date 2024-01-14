# hash_compare

The script uses CertUtil to obtain the SHA256 hash of each file and stores them in variables %HFILE1% and %HFILE2%.
It compares the hashes and prints different messages depending on whether they match or differ.
The script echoes the values of %HFILE1% and %HFILE2% to the console.
The pause command at the end is used to keep the console window open so that the user can see the results.
Note: Make sure to replace the file names in the CertUtil -hashfile commands with the actual file paths you want to check. Also, be cautious when using batch scripts for security-related tasks; consider using more advanced scripting languages for more robust hash verification.
