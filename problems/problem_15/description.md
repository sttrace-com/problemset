You are given a text file named `files.txt`. Each line in this file contains a full file path. You need to count how many times each file name appears in the list. Store the results in `results.txt` in the ascending order of counts.

### Example `files.txt` format
```files.txt
/home/user/docs/report.txt
/var/log/nginx/access.log
/usr/local/bin/script.sh
/home/user/photos/vacation/photo.jpg
...
```

### Expected `results.txt` format
```results.txt
logfile.jpg 3
notes.log 4
report.txt 4
logfile.bak 5
script.bak 5
backup.cfg 7
...
```