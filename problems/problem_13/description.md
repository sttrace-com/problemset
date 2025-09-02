You've received some text files from your client. They transferred the files via FTP. After inspecting those files, one of your colleagues from the client services team pings you, saying that some of the files might be corrupted. Luckily, the client has also sent the original **sha256** checksums for all the files in **shasums.txt**. Now you need to identify all the corrupted files so you can send the list back to the client.

Create two text files, **corrupted.txt** and **uncorrupted.txt**, and put the file names of the respective files in them.

### Example format for **corrupted.txt**
```corrupted.txt

file_23238.txt
file_15236.txt
file_2985.txt
...
```

### Example format for **uncorrupted.txt**
```uncorrupted.txt
file_23268.txt
file_1526.txt
file_29785.txt
...
```

**Note:** The order of file names in **corrupted.txt** and **uncorrupted.txt** should match the order of file names in **shasums.txt**