#!/bin/zsh
#### Modificaciones para que tome un usuario como parametro
#### $1 es el nombre del usuario



if [ -n "$1" ]
then
  usermod -L $1
  chage -E0 $1
  usermod -s /sbin/nologin $1
  if [ $? -eq 0 ]; then
   echo "Imprimiendo el estatus del password del usuario:"
   echo "Estatus: $(passwd --status $1) "
   echo "Imprimiendo el estatus de expiracion del password"
   echo "Expiracion: $(chage -l $1)"
   echo "Imprimiendo la informacion del usuario desde /etc/passwd"
   echo "Info Usuario $(cat /etc/passwd | grep $1)"
  else
    echo "Se produjo un error en la ejecucion de los comandos "
  fi
else
  echo "Forma de uso:  $0 nombre_de_usuario"
fi


