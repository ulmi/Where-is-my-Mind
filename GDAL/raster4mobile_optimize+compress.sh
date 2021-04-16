#!/bin/bash

#realiza um clip sobre o raster, com um ficheiro clip.shp da área pretendida
gdalwarp -of GTiff -tr 0.5 -0.5 -tap -cutline clip.shp -cl clip -crop_to_cutline -multi -co NUM_THREADS=ALL_CPUS basemap.gpkg OUTPUT.tif;

#cria um gpkg comprimido em WEBP com o nome da pasta "${PWD##*/}"
gdal_translate -b 1 -b 2 -b 3 -of GPKG OUTPUT.tif "${PWD##*/}".gpkg -co TILE_FORMAT=WEBP;

#cria as overviews do gpkg comprimido em WEBP com o nome da pasta "${PWD##*/}"
gdaladdo --config OGR_SQLITE_SYNCHRONOUS OFF -r AVERAGE "${PWD##*/}".gpkg 2 4 8 16 32 64 128 256

done
