You are given a binary that depends on external APIs.  
Those APIs are unreliable, which makes the binary **flaky**, sometimes it succeeds, sometimes it fails with different exit codes.  

Your task is to build a `handler` script which triggers this binary and prints appropriate message based on the exit code. Refer following talbe for exit code to message mapping.

---

### Exit Code Mapping

| Code        | &nbsp;&nbsp;Message                             |
|-------------|-------------------------------------------------|
| `0`         | &nbsp;&nbsp;Success                             |
| `1`         | &nbsp;&nbsp;General Error                       |
| `127`       | &nbsp;&nbsp;Command Not Found                   |
| `130`       | &nbsp;&nbsp;Terminated by SIGINT (Ctrl+C)       |

---

### Expected output
```bash
ubuntu@902bfb83788f:~$ /home/ubuntu/handler
Success
ubuntu@902bfb83788f:~$ /home/ubuntu/handler
Terminated by SIGINT (Ctrl+C)
ubuntu@902bfb83788f:~$ /home/ubuntu/handler
General Error
...
```

### Acceptance criteria
- `handler` should be present in `/home/ubuntu`
- `handler` should have appropriate permissions
- `handler` will be triggered as executable, example `/home/ubuntu/handler`

### Note
- You are allowed to use any programming language
- You have `sudo` permissions to install any package, example `sudo apt install vim`
