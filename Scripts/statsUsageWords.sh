#!/bin/bash

#mostrar un top 10 de palabras de mas de 4 letras con mas apariciones

for C in $(cat $1); do
	if [[ ${#C} > 3 ]]; then
		echo ${#C} $C
	fi
done

echo "4 5 2 6"
