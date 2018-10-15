## Command-line tips for *hack n' slash* PDF's

Convert a pdf to tiff with IMAGEMagick
`convert -density 300 -trim 08_DES_PLANTA_DE_IMPLANTACAO.pdf -quality 100 test.tif`

Convert a .PDF to a TIFF color with ghostscript

`gs -dNOPAUSE -r300 -sDEVICE=tiff24nc -sOutputFile=output.tif 08_DES_PLANTA_DE_IMPLANTACAO.pdf`
