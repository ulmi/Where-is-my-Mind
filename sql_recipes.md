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

optimized subqyer example
```sql
WITH poly AS (SELECT * FROM Cont_AAD_CAOP2019 as caop
        where caop.CONCELHO in ('VILA NOVA DE POIARES', 'ARGANIL', 'LOUSÃ', 'CASTANHEIRA DE PÊRA', 'PAMPILHOSA DA SERRA', 'PEDRÓGÃO GRANDE'))
SELECT st_difference(st_union(poly.geometry),b.geometry)
FROM "Limite de Concelho" b, poly
WHERE ST_Intersects(b.geometry, poly.geometry);
```

Finding duplicates
```sql
select * from (
select row_number() over (partition by geom order by id asc) as row,
name, geom from only schema.tabela) as dups where dups.row > 1
```
