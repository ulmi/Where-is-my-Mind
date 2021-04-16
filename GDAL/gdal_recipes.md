
Compress to GeoTIFF

add -b 1 for each band 1, 2, 3, 4 you want

```bash
-b 1 -b 2 -b 3 -b 4
```

```bash
gdal_translate -co COMPRESS=JPEG -co PHOTOMETRIC=YCBCR -co PREDICTOR=1 -co "TILED=YES" input.tif output.tif
```
Compress a 16bit GeoTIFF to 8bit one
``` 
gdal_translate -ot Byte -scale -co COMPRESS=JPEG -co PHOTOMETRIC=YCBCR -co "TILED=YES" input.tif output.tif
```

Transform raster to gpkg

```bash
gdal_translate --config OGR_SQLITE_SYNCHRONOUS OFF -co  APPEND_SUBDATASET=YES -co TILE_FORMAT=PNG_JPEG
-a_srs EPSG:3763 -co RASTER_TABLE=ORTOS -of GPKG ortos_compress.tif raster.gpkg
```

```bash
gdaladdo --config OGR_SQLITE_SYNCHRONOUS OFF -r AVERAGE raster.gpkg 2 4 8 16 32 64 128 256
```

Transform a GeoTiff to KMZ with support for alpha channel (-co format=png)

```bash
gdal_translate -of KMLSUPEROVERLAY -co format=png input.tif output.kmz
```
