Remove narrow polygons with PostGIS

```sql
select * from polygons where ST_Length(ST_LongestLine(geom, geom)) < ST_Area(geom) * 4
```
