## Command-line tips for *hack n' slash* PDF's

Convert a pdf to tiff with IMAGEMagick with 300 dpi

`convert -density 300 -trim input.pdf -quality 100 output.tif`

Convert a .PDF to a TIFF, PNG or JPEG with color with ghostscript, in case the other one fails

```
gs -dNOPAUSE -r300x300 -sDEVICE=tiff24nc -sOutputFile=output.tif input.pdf
gs -dNOPAUSE -r300x300 -sDEVICE=pngalpha -sOutputFile=output.png input.pdf
gs -dNOPAUSE -r300x300 -sDEVICE=jpeg -sOutputFile=output.jpg input.pdf
```
