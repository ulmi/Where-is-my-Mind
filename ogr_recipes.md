#### Merge multiple vector files
copied from [https://www.northrivergeographic.com ](https://www.northrivergeographic.com/ogr2ogr-merge-shapefiles)
```bash
#!/bin/bash
mkdir final
file=”./final/merge.shp”
filename=${file##*/}

for i in $(ls *.shp)
do

      if [ -f “$file” ]
      then
           echo “merging $i”
           ogr2ogr -f ‘ESRI Shapefile’ -update -append $file $i -nln ${filename%.*}
      else
           echo “creating $file”
      ogr2ogr -f ‘ESRI Shapefile’ $file $i
fi
done
```

#### Merge multiple vector files by attribute

needed to add \\"${i%.*}\"\ to ignore the name of input file with special chars and also remove the extension   

```bash
#!/bin/bash

mkdir final

file="./final/pcotados_merge.shp"
filename=${file##*/}

for i in $(ls *txt.shp)
do

      if [ -f "$file" ]
      then
           echo "merging $i" 
           ogr2ogr -f 'ESRI Shapefile' -sql "SELECT * FROM \"${i%.*}\" WHERE xisCod=3010201" -update -append $file $i -nln ${filename%.*}
      else
           echo "creating $file"
           ogr2ogr -f 'ESRI Shapefile' -sql "SELECT * FROM \"${i%.*}\" WHERE xisCod=3010201" $file $i
fi
done
```

You can add the filename to the attribute table, with `-sql "SELECT *,'${i%M*}' AS carta_numb FROM \"${i%.*}\""` 


#### export DXF, separate by layer, where ATTRIB is the column name
```bash
ogr2ogr -f DXF output.dxf input.shp -sql "SELECT ATTRIB AS Layer FROM input"
```

```bash
ogr2ogr -f DXF output.dxf input.shp -zfield ATTRIB
```
