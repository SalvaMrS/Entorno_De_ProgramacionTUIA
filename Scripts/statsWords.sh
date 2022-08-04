#!/bin/bash

LARGO=''
LLARGO=0
CORTO=''
LCORTO=99
TOTAL=0
CANTIDAD=0

#Por cada palabra si es mas larga que LARGO reemplazalo por esta
#Y si es mas corto que CORTO reemplazalo por esta

for E in $(cat $1); do
	let TOTAL+=${#E}
	let CANTIDAD++

	if [[ $LLARGO < ${#E} ]]; then
		LARGO=$E
		LLARGO=${#E}
	fi

	if [[ ${#E} < $LCORTO ]];then
		CORTO=$E
		LCORTO=${#E}
	fi
done

#Calculamos el promedio

PROMEDIO=$(($TOTAL/$CANTIDAD))

echo
echo "Del archivo $(basename $1):"
echo
echo "-La palabra más larga es \"$LARGO\" con una longitud de $LLARGO caracteres"
echo
echo "-La palabra más corta es \"$CORTO\" con una longitud de $LCORTO caracteres"
echo
echo "-El promedio de caracteres por palabra es de $PROMEDIO"
