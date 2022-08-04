#!/bin/bash

RESULTADO=$( grep -v '\S' $1 | grep -v '\s' | wc -l)

echo "La cantidad de líneas en blanco en el archivo $(basename $1) es de $RESULTADO."

# '\S' machea las lineas con algún caracter
# '\s' machea las líneas con espacios en blanco
# -v invierte la selección
