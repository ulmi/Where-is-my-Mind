### Merge multiple vector files 
```bash
#!/bin/bash
mkdir final
file=”./final/merge.shp”

for i in $(ls *.shp)
do

      if [ -f “$file” ]
      then
           echo “creating final/merge.shp”
           ogr2ogr -f ‘ESRI Shapefile’ -update -append $file $i -nln merge
      else
           echo “merging……”
      ogr2ogr -f ‘ESRI Shapefile’ $file $i
fi
done
```

### Merge multiple vector files by attribute

needed to add \\"${i%.*}\"\ to ignore the name of input file with special chars and also remove the extension   

```bash
#!/bin/bash

mkdir final

file="./final/pcotados_merge.shp"

for i in $(ls *txt.shp)
do

      if [ -f "$file" ]
      then
           echo "merging $i" 
           ogr2ogr -f 'ESRI Shapefile' -sql "SELECT * FROM \"${i%.*}\" WHERE xisCod=3010201" -update -append $file $i -nln pcotados_merge
      else
           echo "merging……"
           ogr2ogr -f 'ESRI Shapefile' -sql "SELECT * FROM \"${i%.*}\" WHERE xisCod=3010201" $file $i
fi
done
``
