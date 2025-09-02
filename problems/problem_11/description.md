Following a recent deployment, it was reported that some binaries may contain a hardcoded password.

The issue was raised shortly after the release was completed. The company’s release system automatically renames each binary using the format **[random_number]_bin**, making it impossible for developers to directly identify which artifact is affected. Only the DevOps team has access to the deployment server, so the investigation has been assigned to you. One of the developers has provided the suspected hardcoded password to aid in the analysis.  

Search through the deployed binaries on the server, identify any that contain the hardcoded password, and log the filenames in **results.txt** for remediation.

### Hardcoded password
```text title="password.txt"
Q6A0fg>MXF`QbTNpX8^Pg(0Z
```

### Expected `results.txt` format
```text title="results.txt"
2313_bin
4434_bin
1234_bin
...
```

**Note:** 
- You have `sudo` access to install any security tools that you want.
- The order in which you store the names of binares does not matter.