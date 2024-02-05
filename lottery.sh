#!/bin/bash

clear

read -p "Introduce el numero maximo: " num_input

# Verificar si la entrada es un número válido
if ! [[ "$num_input" =~ ^[0-9]+$ ]]; then
  echo "Error: Debes introducir un número entero válido."
  exit 1
fi

# Generar un número aleatorio en el rango [0, num_input]
system_number=$((RANDOM % (num_input + 1)))

intentos=1

for (( ; ; ))
do
  read -p "Adivina este número de la lotería, este es tu intento $intentos: " user_number

  if [ $user_number -eq $system_number ]; then
    echo "Has ganado la lotería con $intentos intentos. ¡Bien hecho! Comparte un poco, anda."
    break
  else
    echo "Te has equivocado."
    if [ $user_number -gt $system_number ]; then
      diferencia=$((user_number - system_number))
      if [ $diferencia -gt 10000 ]; then
        echo "Mucho más pequeño."
      else
        echo "Un poco más pequeño."
      fi
    else
      diferencia=$((system_number - user_number))
      if [ $diferencia -gt 10000 ]; then
        echo "Mucho más grande."
      else
        echo "Un poco más grande."
      fi
    fi
  fi
  intentos=$((intentos+1))
done

