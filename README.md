# TP_Entorno_de_Programacion_TUIA

  Este es un Trabajo Practico Final de la materia de Entorno de Programación de la
carrera de Tecnicatura en Inteligencia Artificial.

  Los elementos que intervienen en este TP son:
  
-*Menu.sh*

  Crea un menú para la seleccion del script a ejecutar y con que archivo ejecutar este. 
  Además de permitir seleccionar una guia rápida de los scripts.
  
  
-*SCRIPTS:*
1. *blankLinesCounter.sh*

	Contador de líneas en blanco.
  
    Retorna la cantidad de lineas en blanco de un archivo. Se considera linea en blanco
  a una linea sin ningún caracter incluido el espacio " ".
  
  
2. *findNames.sh*

	Identificación de nombres propios.

	  Retorna una lista de palabras con solo la primer letra en mayusculas (Nnnnnn). 
    

3. *statsSentences.sh*

	Indicador estadístico de longitud de oraciones.

	Retorna la oración con mas caracteres, con menos caracteres y el promedio de 
caracteres por oracion del archivo. Se considera oracion a las palabras antes de un ". " 
no se toma en cuenta si se encuentra en otra línea del archivo.


4. *statsUsageWords.sh*

	Indicador estadístico de uso de palabras de cuatro letras o más.

	Retorna un top 10 de las palabras de al menos cuatro caracteres con mas 
apariciones en el archivo de texto ingresado.


5. *statsWords.sh*

	Indicador estadístico de longitud de palabras.

	Indica del archivo de texto ingresado la palabra com mayor cantidad de 
caracteres, la que posee menor cantidad y el promedio de caracteres por palabra.


-*Ejemplo.txt*

  Es un archivo general para la prueba de los scripts.
  
  
-*Dockerfile*

  Permite la creacion del contenedor con base de ubuntu.
  

# EJECUCION

En primera instancia si poseemos un archivo de texto (.txt) que deseamos ejecutar en el
contenedor lo agregamos en la carpeta Archivos. Una ves realizado esto y teniendo 
instalado docker en nuestra computadora (https://docs.docker.com/desktop/) ingresamos por
consola al directorio del proyecto y creamos el contenedor con los siguientes comandos:

-sudo docker build --tag tp-entorno.

Y lo ejecutamos con:

-sudo docker run -it tp-entorno

Una ves ejecutado aparecerá un menú de seleccion y una ves escogido el script que 
deseamos ejecutar nos aparecerá una lista de archivos de texto con los que podemos 
ejecutar el script.

Cuando termina la ejecución volveremos a la seleccion de scripts.

Para salir seleccionamos VOLVER y/o EXIT.
