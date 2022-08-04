#!/bin/bash

NOMBRE="^[A-Z][a-z]+"

echo
echo "Lista de nombres propios (Nnn) en el archivo $(basename $1):"
echo

#filtramos del archivo las palabras que inicien en mayusculas y prosigan en minusculas y las imprimimos en consola
for PAL in $(cat $1); do
	if [[ $PAL =~ $NOMBRE ]];then
		echo "-$PAL"
	fi
done
