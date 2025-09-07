We need to implement a `handler` script that triggers the given binary and prints the correct message based on its exit code.

---

### Bash Solution

Create `/home/ubuntu/handler` with the following contents

```bash
#!/usr/bin/env bash

BINARY="/home/ubuntu/binary"

"$BINARY"
status=$?

case $status in
    0)
        echo "Success"
        ;;
    1)
        echo "General Error"
        ;;
    127)
        echo "Command Not Found"
        ;;
    130)
        echo "Terminated by SIGINT (Ctrl+C)"
        ;;
esac
```

### Python Solution

Alternatively, we can implement the same logic in Python.

```python
#!/usr/bin/env python3
import subprocess
import sys
import os

BINARY = "/home/ubuntu/binary"

proc = subprocess.run([BINARY])
status = proc.returncode

messages = {
    0: "Success",
    1: "General Error",
    127: "Command Not Found",
    130: "Terminated by SIGINT (Ctrl+C)"
}

print(messages[status])
```

### Finally you need to make the script executable
```bash
chmod +x /home/ubuntu/handler
```