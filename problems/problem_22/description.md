You've received a text file from one of your clients. You get a message that there is an issue with the automated script which was supposed to generate the file, and the file you've received is in reverse order. It will take some time for the client to generate a new file.

Since it's quite urgent, you have been tasked with fixing this broken file. Your job is to reverse the line order of the `file.txt` (last line first) and store the result in `result.txt`.

### Example `file.txt`
```file.txt
...
743124a1f945a4caaa57598568b1f620-e2ed4583cd410e9bd6a858f068b1f620-21439
02c2999743406f7f62a70ccd68b1f62b-4125c424a0f318b97d5e56d968b1f62b-22397
94eae279dd025815462dcadc68b1f63f-ce2d7150c73961f38ff09bf668b1f63f-759
```

### Expected `result.txt`
```result.txt
94eae279dd025815462dcadc68b1f63f-ce2d7150c73961f38ff09bf668b1f63f-759
02c2999743406f7f62a70ccd68b1f62b-4125c424a0f318b97d5e56d968b1f62b-22397
743124a1f945a4caaa57598568b1f620-e2ed4583cd410e9bd6a858f068b1f620-21439
...
```

### Acceptance criteria
- `result.txt` should be present in `/home/ubuntu`
- `result.txt` should be reversed content of `file.txt`