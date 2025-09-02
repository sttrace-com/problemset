You have a Python script set up on your server. This script is triggered by internal monitoring tools to collect server information and other required statistics. You’ve received multiple error alert emails indicating that the script is failing. Recently, there was a maintenance update on that server, so there’s a chance something might have changed.

You have now SSHed into the machine to investigate the issue.

### Acceptance Criteria
- You are not allowed to change the script’s functionality, location, or name.

### Note
- You have `sudo` access to install packages, for example: `sudo apt install vim`
- The script will be evaluated by running `./monitord`