#!/bin/bash

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

IFS=$'\n' LISTA=$( sort -r <<< "${REPETICIONES[*]}")
unset IFS

TOP=1

echo ""
echo "--- 10 palabras con mas apariciones en $1 ---"
echo ""

for E in $LISTA; do
	echo "Top $TOP con $E apariciones:${INVERSO[$E]}"
	echo ""
	let TOP++
	PROV=$E
done
