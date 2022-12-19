sudo service docker stop
sudo service docker start 

#Para pararlos puede usarse:
docker stop $(docker ps -a -q)
#Y para eliminarlos:
docker rm $(docker ps -a -q)
#Borrar todas la imagenes
docker rmi $(docker images -a -q)

docker system df ##Ver espacio usado por volumenes, imagenes y contenedores

docker ps  #Muestra la los contenedores en ejecucion.
docker ps -a #Muestra todos lo conteneros incluidos los que se han detenido.
docker kill idcontenedor  #Matar o Apagar un contenedor en ejecución
docker run --rm imagen sleep 1 #El contenedor funcionaria por 1 Segundo y con --rm el contenedor se elimina apenas se dentenga.
docker run --name hello_world imagen  # Con este comando se define un nombre para el nontenedor
docker run -d imagen sleep 100 #Ejecuta un contenedor en segundo plano por 100 segundos
docker rmi sg_sims/socket-sims:v1.0  #Eliminar una imagen

docker inspect idcontenedor #Muestra la configuracion del contenedor

docker build -t eduardo_3226/config-server:v1.0 .  # Con eso se construtye una imagen a partir de una DockerFile el punto al final indica la ubicacion del dockefile
docker run -it --rm -p 8888:8080 tomcat:9.0  #-p nos permite asignarle un puerto al contenedor
docker run -p 8888:8888 --name nombrecontenedor --network nombredered nombreimagen/amontar:version # Con este coomando montamos un contenedor dentro de una red a partir de una imagen y le definimos un nombre
docker run --name motorsms1 -d -p 4848:4848 -p 8080:8080 supergiros/motorsms:v.1.0
#EJEMPLOS
docker run -p 8888:8888 --name eureka-server --network sprngcloud eduardo_3226/eureka-server:v1.0

docker run -P --name nombrecontenedor --network nombredered nombreimagen/amontar:version   #con -P mayuscula levanta el contenedor con un puerto aleatorio

docker container ls #Con esto podemos la lista de contenedores
docker inspect nombrecontenedor #Con esto podemos ver todos los detalles de configuracion de un contenedor

docker logs idcontenedor #Permite concultar los losg del contenedor que esta en ejecucion.
docker logs idcontenedor -f #Permite concultar los losg del contenedor que esta en ejecucion. con -f se queda escuhcando el log
winpty docker run -it debian:jessie    #Se descarga la imagen y quedamos dentro del contenedor
winpty docker run -it debian:jessie -p 8080:8080 -d   #Se descarga la imagen y quedamos dentro del contenedor
docker images   #Me permite ver las imagenes docker
docker commit idcontenedororigen nuevaimagen/repositorioofifial:1.00  #Con esto se crea una nueva imagen a partir de un contenedor que esta en ejecicion
#docker load > rutaimagen/nombreimagen  # Cargar imagen comprimida.tar
docker load < rutaimagen/nombreimagen  # Cargar imagen comprimida.tar
docker save supergiros/motorsms:v.1.0 > motorsms.tar  # Exportar imagen en .tar

docker import /opt/motrosms.tar supergiros/motorsms:v1.0

docker logs d2a34e3cc1ccc0c829bd3b3fcf523cac235590fa8dc98cbaecb16a58411023fa

docker start nombrecontenedor #con esto volvermos a levantar un contenedor
docker stop nombrecontenedor 
docker stop $(docker ps -q)  #Detiene todos los dontenedores que estan en ejecucion
docker rm $(docker ps -aq)  #Elimina todos los contenedores que estan en ejecucion

docker exec -it idcontenedo bash #Con este comando ejecutamos comando dentro del contenedor en este caso ingresamos a los directorios del contenedor.
docker exec -it -u root nextcloud /bin/bash
docker-machine ls #Con este comando vemos la IP de la maquina virtual de docker donde se estan montando los contenedores

docker container prune
docker system prune

docker cp backup_de_mi_DB.DAT 9fe295cb4a3b:/v1app/app_preproduccion   #COpiar archivo a un contendor
docker cp mssql-server-linux:/ruta/hacia/el/fichero ./fichero  #Copiar archivo desde un contenedore al local

#REDES EN DOCKER
route -n  ##Para ver subredes del server donde esta el docker
docker network create nombredered #Asi se crea una red
docker network inspect nombredered  #Ver configuracion de red


#IMagenes
#Dockerfile
#Links entre contenedores

#Docker composer, sirve para automatizar el levantamiento de todas los contenedores requeridos por una aplicacion
docker-compose up   #Inicia todos los contenedores
docker-compose up -d   #Inicia todos los contenedores en segundo plano
docker-compose ps 	#Verifica el estado de los contenedores gestionados por docker compose
docker-compose logs #Genera registros a color para los contenedores administrados por compose
docker-compose logs -f #Genera un registro adjunto cuando el registro sea muy largo
docker-compose logs nombrecontenedor #Genera registro de un contenedor en especifico
docker-compose stop #Detiene los contendores en ejecucion sin eliminarlos
docker-compose rm #Elimina todos los contenedores
docker-compose build #Recontruye todas las imagenes
docker-compose down -v #Elimina los contenedores y las redes


##COMANDO PARA DESPLEGA WAR SIN SERVER DE APLICACIONES
/home/jhipster # cat entrypoint.sh
#!/bin/sh
 
echo "The application will start in ${​​​​JHIPSTER_SLEEP}​​​​s..." && sleep ${​​​​JHIPSTER_SLEEP}​​​​
exec java ${​​​​JAVA_OPTS}​​​​ -Djava.security.egd=file:/dev/./urandom -jar "${​​​​HOME}​​​​/app.war" "$@"




