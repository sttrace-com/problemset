The production server hosts multiple applications that store their log files in the `logs` directory. You have a monitoring setup for this server and start receiving alerts about high disk usage. You SSH into the server to investigate the issue.

You notice that there are many log files, and the automated script that rotates these files is missing. Your team lead asks you to manually rotate the log files until someone on the team fixes the script.

Your task is to move all log files larger than `15Kb` into an archive file named `archived.tar`.

### Acceptance Criteria
- All log files greater than `15Kb` should be moved into `archived.tar`.  
- Ensure that none of the rotated log files remain in the `logs/` directory.  
- Log files whose size is exactly `15Kb` should **not** be included in `archived.tar`.
