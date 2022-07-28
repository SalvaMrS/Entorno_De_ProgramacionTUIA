#!/bin/bash

#mostrar un top 10 de palabras de mas de 4 letras con mas apariciones

declare -A REPETICIONES

for PALABRA in $(grep -P -o '\b\w+\b' $1); do
	if [[ ${#PALABRA} > 3 ]]; then
		let REPETICIONES[$PALABRA]++
	fi
done

declare -A INVERSO

for PALABRA in ${!REPETICIONES[@]}; do
	INVERSO[${REPETICIONES[$PALABRA]}]+=" $PALABRA"
done

LISTA=$( echo ${REPETICIONES[@]} | sort | uniq -c | sort -nr | head -10 )

echo $LISTA

TOP=0
PROV=""

for E in $LISTA; do
	if [[ $E != $PROV ]]; then
		PROV=$E
		let TOP++
	fi
done

echo $TOP

echo ""
echo "--- 10 palabras con mas apariciones en $1 ---"
echo ""

for E in $LISTA; do
	if [[ $E != $PROV ]]; then
		echo "Top $TOP con $E apariciones:${INVERSO[$E]}"
		echo ""
		let TOP--
		PROV=$E
	fi
done
