You have a file processing script that you deployed last week. You get a message from internal dev teams that the script is taking too long. `script.py` is called by an external API which has a `0.02 seconds` timeout. Unfortunately, there is no easy way to change this timeout. So you decide to optimize the script. It's a simple script which takes an input file, does some processing, and dumps the results into an output file.

Can you fix the script to drop processing time below `0.02 seconds`?

### Acceptance Criteria
- Optimize run time of current script to `< 0.02 seconds` with `sample.txt` as input.
- You are not allowed to change the original functionality of script.
- The output files before and after the changes should match.

### Note
- You have sudo access to install packages, e.g., `sudo apt install vim`.
- Final script will be evaluated against input files with `~3000` lines.
- During submission, if the script takes more than 2 seconds, it will be terminated.

### Example script usage
```usage
./script sample.txt op.txt
```