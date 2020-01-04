Remove narrow polygons with PostGIS

```sql
select * from polygons where ST_Length(ST_LongestLine(geom, geom)) < ST_Area(geom) * 4
```

Finding dead-ends or dangles on a network

```sql
WITH deadends AS
(SELECT id, ST_StartPoint(geometry) AS pt
FROM network
UNION ALL
SELECT id, ST_EndPoint(geometry) AS pt
FROM network)
SELECT min(id), pt
FROM deadends
GROUP BY pt
HAVING count(*) = 1;
```
