## Command-line tips for *hack n' slash* PDF's

#### Convert
Convert a pdf to tiff with IMAGEMagick with 300 dpi

`convert -density 300 -trim input.pdf -quality 100 output.tif`

Convert a .PDF to a TIFF, PNG or JPEG with color with ghostscript, in case the other one fails

```
gs -dNOPAUSE -r300x300 -sDEVICE=tiff24nc -sOutputFile=output.tif input.pdf
gs -dNOPAUSE -r300x300 -sDEVICE=pngalpha -sOutputFile=output.png input.pdf
gs -dNOPAUSE -r300x300 -sDEVICE=jpeg -sOutputFile=output.jpg input.pdf
```
Convert a multiple page .pdf
```
gs -dNOPAUSE -dBATCH -sDEVICE=png16m -sOutputFile="Pic-%d.png" input.pdf
```

#### Compress

Compress a .PDF
```
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=out.pdf in.pdf
```
**-dPDFSETTINGS can be any of:**
* **/screen** : low-resolution output, lowest output size
* **/ebook** : medium-resolution output, medium output size
* **/printer** OR **/prepress** : high-resolution with maximum output size

Simplier but as powerfull

```
qpdf --linearize --object-streams=generate input.pdf output.pdf
```
