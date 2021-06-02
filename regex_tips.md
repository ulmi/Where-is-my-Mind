
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
 **append to the end of specific string (VSCODE; Sublime; whatever)**

* add to find `^(what you want to find.*` note: you should add `\` to ignore the patterns `.*` adds whatever comes next after the string you are searching
* on the find field add `$1 with what you want to add at the end`  note: `$1` adds the string you searched.

**select a string with numbers and text**
```bash
(?:\d+[a-z]|[a-z]+\d)[a-z\d]*
```
