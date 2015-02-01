cd /D %~dp0


echo Generate the package style and config file
latex xcookybooky.ins


echo Generate the glossary and index files (and a temporary documentation)
pdflatex xcookybooky.dtx


echo Generate the glossary style file
makeindex -s gglo.ist -o xcookybooky.gls xcookybooky.glo


echo Generate the index style file
makeindex -s gind.ist -o xcookybooky.ind xcookybooky.idx


echo Generate the complete documentation
pdflatex xcookybooky.dtx


echo Rerun for updating the content
pdflatex xcookybooky.dtx

echo Copy the style file to the testing folder
copy xcookybooky.sty "testing/xcookybooky.sty" /Y

echo Copy the style file to the example folder
copy xcookybooky.sty "example/xcookybooky.sty" /Y

timeout 20