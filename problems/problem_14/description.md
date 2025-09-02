Your production service discovery agent logs requests for all downstream services into the `services.log` file. Occasionally, you download these log files for analysis. However, due to new compliance rules, you are no longer allowed to download anything from production servers to your local machine. Your team lead informs you that you can still `ssh` into the server to perform your analysis. Since you no longer have access to your local tools, you need to find alternative ways to analyze the logs.

Create a CLI tool named `lproc` with the following functionalities

| Command                    | Description                                                                    |
|----------------------------|--------------------------------------------------------------------------------|
| `count`                    | Prints the total number of logs in the file                                    |
| `find <word>`              | Prints all the logs where the word `<word>` occurs in any column               |
| `find <col_num> <word>`    | Prints all the logs where the column numbered `<col_num>`matches `<word>`      |

### Acceptance criteria
- Log file contents will be passed via `STDIN`.
- The CLI must have executable permissions.
- The CLI must reside in the `/home/ubuntu` directory.
- The CLI must be named `lproc`.
- The header row does not count at a valid log, so it should not be counted in `count` command.
- `find` command should also print column headers.


### Example test cases
```cli
./lproc find 2 ERROR < log_file
TIMESTAMP             LEVEL   SERVICE          REQUEST_ID   USER          MESSAGE
2025-08-19 11:00:03   ERROR   payment-service  req-003      bob.lee       Payment failed: insufficient funds
2025-08-19 11:04:22   ERROR   auth-service     req-007      jane.smith    Invalid session token
2025-08-19 11:09:12   ERROR   payment-service  req-013      bob.lee       Transaction timeout
2025-08-19 11:11:47   ERROR   auth-service     req-017      jane.smith    Too many login attempts
...

./lproc count < log_file
> 30

./lproc find Payment < log_file
TIMESTAMP             LEVEL   SERVICE          REQUEST_ID   USER          MESSAGE
2025-08-19 11:00:03   ERROR   payment-service  req-003      bob.lee       Payment failed: insufficient funds
2025-08-19 11:21:18   ERROR   payment-service  req-033      bob.lee       Payment service unavailable
2025-08-19 11:27:12   ERROR   payment-service  req-043      bob.lee       Payment rollback failed
...
```

### Notes
- You are free to use any tech stack.
- You have sudo rights to install packages, e.g., `sudo apt install nano`
- Your CLI will be validated against `services.log` file.