#!/bin/bash

#-------------------------------------------------------------------
#Indicador estadistico de longintud de oraciones
#(la mas larga,la mas corta y el promedio de longitud)
#-------------------------------------------------------------------

INPUT=("$(echo ${@//./. })") #-->"." reemplaza por ". "
CONTADOR=0
PUNTO='([.])$' #---------------->termina en "."
declare -a oraciones
declare -a longitudes

#---Agrego a lista(longitudes)cantidad de palabras por oracion-------

for palabra in $INPUT;do
	acumulador=("")
	if ! [[ $palabra =~ $PUNTO ]];then
		let CONTADOR=$(echo $CONTADOR)+1
		acumulador+="$palabra "
	elif [[ $palabra =~ $PUNTO ]];then
		let CONTADOR=$(echo $CONTADOR)+1
		longitudes+=("$(echo ${CONTADOR}) ")
		CONTADOR=0
		acumulador+="$palabra "
		oraciones+="${acumulador[@]}"
		acumulador=""
	fi
done
#--------------------------------------------------------------------

#---Oraciones de mayor y menor longitud------------------------------

LARGA=${longitudes[0]}
CORTA=${longitudes[0]}
INDICE_BUCLE=1
INDICE_LARGO=1
INDICE_CORTO=1
for i in ${longitudes[@]};do
	if [[ $i -ge $LARGA ]];then
		LARGA=$i
		INDICE_LARGO=$INDICE_BUCLE
	elif [[ $i -le $CORTA ]];then
		CORTA=$i
		INDICE_CORTO=$(echo $INDICE_BUCLE)
	fi
	let INDICE_BUCLE=$INDICE_BUCLE+1
done
echo "---------------------------------------------------------------------"
echo "La oracion mas larga es la ${INDICE_LARGO}a. y tiene $LARGA palabra/s."
echo "La oracion mas corta es la ${INDICE_CORTO}a. y tiene $CORTA palabra/s."
#--------------------------------------------------------------------

suma=0
cantidad=0
for valor in ${longitudes[@]}
do
	suma=$((suma+valor))
	cantidad=$((cantidad+1))
done

let promedio=$suma/$cantidad

# "suma: $suma cantidad de longitudes: $cantidad"
echo "El promedio de longitud es de $promedio palabra/s"
echo "----------------------------------------------------------------------"
