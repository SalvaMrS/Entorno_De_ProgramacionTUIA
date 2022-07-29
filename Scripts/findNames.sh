#!/bin/bash

echo
echo "Lista de nombres propios (Nn) en el archivo $1:"
echo

#filtramos del archivo las palabras que inicien en mayusculas y prosigan en minusculas y las imprimimos en consola
for PAL in $(cat $1 | grep -oE "^[A-Z][a-z]+"); do
	echo "-$PAL"
done
