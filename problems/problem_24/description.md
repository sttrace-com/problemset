Your operations team relies on a nightly export that feeds system identifiers into several internal dashboards. Last night’s job succeeded, but the exported file format was wrong — all values came out in a single comma-separated row instead of proper line-by-line entries.  

Until the upstream fix is deployed, you’ve been asked to repair the file so downstream jobs don’t break. Specifically, you need to take the provided `file.txt`, split its comma-delimited values, and write them as separate lines into `result.txt`.  

### Example `file.txt`
```text
2a7a939e84b746d99d2e1e06a9e3a476,9c2f2e50bf3449fca8dc7cb8e35b9ff1,6d85dbcf4afc4e9b8897ff493acff920
```

### Expected `result.txt`
```text
2a7a939e84b746d99d2e1e06a9e3a476
9c2f2e50bf3449fca8dc7cb8e35b9ff1
6d85dbcf4afc4e9b8897ff493acff920
```

### Acceptance Criteria
- `result.txt` must be created in `/home/ubuntu`  
- Each comma-separated entry from `file.txt` should become its own line in `result.txt`  

### Note
- You have `sudo` permissions to install packages, example `sudo apt install vim`
- The last line in `result.txt` should end with newline character