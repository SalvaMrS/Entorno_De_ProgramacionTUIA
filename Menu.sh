#!/bin/bash

MENU () {
	echo " "
	echo "¿Que script desea ejecutar?"
	echo " "

	#Selección del script a ejecutar
	select OPCION in $( ls -1 "./Scripts/" | grep \.sh$ ) "EXIT"
	do
		echo " "
		if [ -e $OPCION ]; then
			echo "El script no existe. Intentelo de nuevo."
			echo " "
			read -p "Presione cualquier tecla para continuar"
		elif [ $OPCION == "EXIT" ]; then
			break
		else
			ARCHIVO $OPCION
			break
		fi
		MENU
		break
	done
}

ARCHIVO () {
	echo " "
	echo "¿Con qué archivo desea ejecutar el script?"
	echo " "

	#Selección del archivo con el cual ejecutar el script
	select ARCH in $( ls -1 ./Archivos/ | grep \.txt$ ) "VOLVER" ; do
		echo " "
		if [ $ARCH == "VOLVER" ] ; then
			MENU
			break
		elif [ -e $ARCH ];then
			echo "El archivo no existe."
			echo ""
			read -p "presione cualquier tecla para continuar"
		else
			bash ./Scripts/$1 ./Archivos/$ARCH
			echo
			read -p "Presione cualquier tecla para continuar."
		fi
		MENU
		break
	done
}

MENU
