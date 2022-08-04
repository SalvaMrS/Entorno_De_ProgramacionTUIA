#!/bin/bash

LARGO=''
LLARGO=0
CORTO=''
LCORTO=99999999999
TOTAL=0
CANTIDAD=0

PUNTO='[.]$'
ORACION=""

#Por cada oracion si es mas larga que LARGO reemplazalo por esta
#Y si es mas corto que CORTO reemplazalo por esta

for E in $( cat $1); do

	if [[ $E =~ $PUNTO ]]; then
		ORACION="$ORACION $E"

		let TOTAL+=${#ORACION}
		let CANTIDAD++

		if [[ $LLARGO -lt ${#ORACION} ]]; then
			LARGO=$ORACION
			LLARGO=${#ORACION}
		fi

		if [[ ${#ORACION} -lt $LCORTO ]];then
			CORTO=$ORACION
			LCORTO=${#ORACION}
		fi

		ORACION=""
	else
		ORACION="$ORACION $E "
	fi
done

#Calculamos el promedio

PROMEDIO=$(($TOTAL/$CANTIDAD))

echo
echo "Del archivo $1 :"
echo
echo "-La oración más larga es: \"$LARGO\" "
echo "Con una longitud de $LLARGO caracteres"
echo
echo "-La oración más corta es: \"$CORTO\" "
echo "Con una longitud de $LCORTO caracteres"
echo
echo "-El promedio de caracteres por oración es de $PROMEDIO"
