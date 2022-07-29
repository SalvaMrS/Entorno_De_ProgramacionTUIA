#!/bin/bash

#Creamos un diccionario con las palabras como claves y las apariciones como valores

declare -A REPETICIONES

for PALABRA in $(grep -P -o '\b\w+\b' $1); do

	#filtramos las palabras con una longitus menor a 3 caracteres

	if [[ ${#PALABRA} > 3 ]]; then
		let REPETICIONES[$PALABRA]++
	fi
done

#Creamos un diccionario con las apariciones como las claves y las palabras como los valores

declare -A INVERSO

for PALABRA in ${!REPETICIONES[@]}; do
	INVERSO[${REPETICIONES[$PALABRA]}]+=" $PALABRA"
done

#Ordenamos las apariciones de mayor a menor

IFS=$'\n' LISTA=$( sort -gr <<< "${REPETICIONES[*]}")
unset IFS

TOP=1

echo ""
echo "--- 10 palabras con mas apariciones en $1 ---"
echo ""

#Imprimimos en consola el top 10 palabras con mas apariciones

for E in ${LISTA[@]};do
	if [[ ($TOP != 10) && ( $TOP != ${#LISTA} ) ]]; then
		echo "Top $TOP con $E apariciones: ${INVERSO[$E]}"
		echo
		let TOP++
	fi
done

