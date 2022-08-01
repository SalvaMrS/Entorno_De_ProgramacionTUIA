#!/bin/bash

LARGO=''
LLARGO=0
CORTO=''
LCORTO=99
TOTAL=0
CANTIDAD=0

ORACION=""
P="([.])$"

#Por cada palabra si es mas larga que LARGO reemplazalo por esta
#Y si es mas corto que CORTO reemplazalo por esta

for E in $(cat $1); do
        if [[ $E =~ $P ]]; then

		ORACION="$ORACION $E"

		let TOTAL+=${#ORACION}
	        let CANTIDAD++

	        if [[ $LLARGO < ${#ORACION} ]]; then
	                LARGO=$ORACION
	                LLARGO=${#ORACION}
	        fi

	        if [[ ${#ORACION} < $LCORTO ]];then
	                CORTO=$ORACION
	                LCORTO=${#ORACION}
	        fi
		ORACION=""
	else
		ORACION="$ORACION $E"
	fi
done

#Calculamos el promedio

PROMEDIO=$(($TOTAL/$CANTIDAD))

echo
echo "Del archivo $1 :"
echo
echo "-La oracion más larga es \"$LARGO\"" 
echo "Con una longitud de $LLARGO caracteres"
echo
echo "-La oracion más corta es \"$CORTO\" "
echo "Con una longitud de $LCORTO caracteres"
echo
echo "-El promedio de caracteres por oracion es de $PROMEDIO"
