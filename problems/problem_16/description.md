You are given access to a `files.tar.gz` archive.  
It contains nested directories with many different file types.  
Your job is to create a text file for each file extension found in those nested directories and store the list of all files (with their relative paths) inside it.

### Acceptance Criteria
- Create a text file named `<extension>_store.txt` for each file extension found in the `files` directory.  
- The file paths listed must be relative to the `files/` directory.  
- The contents of each text file must be sorted in lexicographical order.  
- Any tampering with the `files/` directory will result in a failed submission.  

### Example `files` Structure
```example
files
|-- 151_fa0213_log.sh
|-- 213_fbd5ea_data.txt
|-- 656_52f6d8_log.log
`-- dir_6_0
    |-- 278_6c2f74_script.log
    |-- 387_f4afe7_service.bak
`-- dir_5_0
    |-- 111_dac2f77_script.log
    |-- 337_sdafe7_service.sh
...
```


### Expected results
```results
user:~$ cat sh_store.txt
files/151_fa0213_log.sh
files/dir_5_0/337_sdafe7_service.sh

user:~$ cat txt_store.txt
files/213_fbd5ea_data.txt

user:~$ cat log_store.txt
files/dir_5_0/111_dac2f77_script.log
files/dir_6_0/278_6c2f74_script.log
files/656_52f6d8_log.log

user:~$ cat bak_store.txt
files/dir_6_0/387_f4afe7_service.bak
...
```