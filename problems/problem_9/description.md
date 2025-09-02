You are given a tar file `data.tar.gz`. It contains multiple JSON files with user data.  
Your job is to extract the `id` and `name` fields from all JSON files and save them to `results.txt`.

### **Example JSON file format**
```json title="user_20.json"
{
    "id": "8b3d5a2c6fe11ab913c72650689f2ee4",
    "name": "User_20",
    "role": "admin",
    "email": "user_20@example.com",
    "age": 27
}
```

### **Expected `results.txt` format**
```text title="results.txt"
8b3d5a2c6fe11ab913c72650689f2ee4 User_20
...
```

**Note:**  The order of lines in `results.txt` does **not** matter.  
