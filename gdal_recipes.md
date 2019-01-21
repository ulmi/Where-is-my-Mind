
Compress to GeoTIFF

```bash
gdal_translate -co COMPRESS=JPEG -co PHOTOMETRIC=YCBCR -co PREDICTOR=1 -co "TILED=YES" input.tif output.tif
```
Compress to GeoTIFF 16bit to 8bit
```bash
gdal_translate -ot Byte -scale -co COMPRESS=JPEG -co PHOTOMETRIC=YCBCR -co "TILED=YES" 171_4_.tif output.tif
```


Transform raster to gpkg

```bash
gdal_translate --config OGR_SQLITE_SYNCHRONOUS OFF -co  APPEND_SUBDATASET=YES -co TILE_FORMAT=PNG_JPEG -a_srs EPSG:3763 -co RASTER_TABLE=ORTOS -of GPKG ortos_compress.tif raster.gpkg
```

```bash
gdaladdo --config OGR_SQLITE_SYNCHRONOUS OFF -r AVERAGE raster.gpkg 2 4 8 16 32 64 128 256
```
