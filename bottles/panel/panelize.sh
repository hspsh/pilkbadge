
rm *.svg
mkdir -p milk
#width = 16mm
kikit panelize \
    --layout 'grid; rows: 2; cols: 5; space: 2mm' \
    --tabs annotation \
    --framing 'railstb; width: 5mm; space: 3mm;' \
    --cuts vcuts \
    --post 'millradius: 1mm' \
    ../milk/milk.kicad_pcb milk/panel_milk.kicad_pcb

kicad-cli pcb export svg -o milk.svg -l Edge.Cuts \
    --exclude-drawing-sheet milk/panel_milk.kicad_pcb

mkdir -p bepis
#width = 13.5mm, 2.5mm diff, need 1.25mm longer tabs
kikit panelize \
    --layout 'grid; rows: 2; cols: 5; space: 2mm' \
    --tabs annotation \
    --framing 'railstb; width: 5mm; space: 3mm;' \
    --cuts vcuts \
    --post 'millradius: 1mm' \
    ../bepis/bepis.kicad_pcb bepis/panel_bepis.kicad_pcb

kicad-cli pcb export svg -o bepis.svg -l Edge.Cuts \
    --exclude-drawing-sheet bepis/panel_bepis.kicad_pcb

code *.svg