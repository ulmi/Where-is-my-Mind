
#### using REGEX on QGIS

**extract the 1st word of a string**
 ```bash
 regexp_substr("field_name", '^(.*?)(?=[ ])')
 ```
 
 **remove weird chars**
 ```bash
 regexp_substr("field_name",'^[^'']+')
 ```
 
 **remove other character like a parenthesis**
```bash
regexp_substr("field_name",'^[^(]+')
```
 
