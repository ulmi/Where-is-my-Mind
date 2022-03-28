
## Aggregate several columns to an array, thus single field, discarding the all NULL values

```
array_to_string (array_remove_all (array (tipo1,tipo2,tipo3,tipo4,tipo5,tipo6),''))
```

## Aggregate multiple equal values to a single one, useful for labels
```
Case When
array_find(array_agg("popid",group_by:="des_simpli"),attribute($currentfeature,'popid')) = 0 
Then
"des_simpli"
else
''
end
```
