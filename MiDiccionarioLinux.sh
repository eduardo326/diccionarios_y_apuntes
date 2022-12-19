##Ver estado de almacenamiento de las particiones
df -h

##Ver version Linux
cat /etc/os-release

ls -lth #ver todos los archivos ocultos

du -sh *  # Ver espacio de cada carpeta

#Ver fecha y hora de servidor
date +'%d/%m/%Y %H:%M'

#Ver procesos en ejecucion
ps -fea | grep java

#Correr War desde consola
java -Xms2867m -Xmx2867m -XX:+UseG1GC -jar gatewaypublicosg-0.0.1-SNAPSHOT.war > gateway.log & disown

#Comprimir y descomprimir .gz, .tar.gz, y .zip por linea de comandos en Linux

	#Archivos .tar.gz:
	#Comprimir: 
	tar -czvf /v1app/sockets.tar.gz /v1app/sockets
	#Descomprimir: 
	tar -xzvf /opt/Apps/openjdk-1.8.0.tar.gz

	#Archivos .tar:
	#Empaquetar: 
	tar -cvf paquete.tar /dir/a/comprimir/
	#Desempaquetar: 
	tar -xvf Comprimido.tar

	#Archivos .gz:
	#Comprimir: 
	gzip -9 index.php
	#Descomprimir: 
	gzip -d Comprimido.dmp.gz

	#Archivos .zip:
	#Comprimir: 
	zip archivo.zip carpeta
	#Descomprimir: 
	unzip Comprimido.zip
	
#Levantar conexion VNC
vncserver :2

#Copiar y cortar archivos
mv Lib/* /usr/local/lib
cp /opt/libsg05.so /usr/local/lib

#Crear enlaces simbolicos
ln -s archivoreal archivosimbolico


#ADMINISTRACION DE SOCKETS
#Monitoreo de log del socket:
tail -f 21082020_23.log ENTER

#Verificar arriba:
ps aux | grep Nom_carpeta_Socket

#Subir el socket ingresando a la carpeta del Socket:
sh AppSocket.sh & ENTER

#bajar el socket:
kill -9 SID_DE_SESION ENTER
o usar el archivo Kill que se encuentra dentro de la carpeta del socket


#Ruta con los script para subir la base de datos o bajarla en el server 44.5
/u01/app/oracle/admin/BDSG01/scripts
#Script sube_bd.sh
export ORACLE_SID=BDSG01;
lsnrctl start
sqlplus /nolog << EOF
conn / as sysdba
startup open 
exit
EOF
#Script baja_bd.sh
export ORACLE_SID=BDSG01;
sqlplus /nolog << EOF
conn / as sysdba
shutdown immediate 
exit
EOF
lsnrctl stop

#Configurar TNS de oracle despues de clonada una maquina
/u01/app/oracle/product/11.2.0/db_1/network/admin/listener.oracle
/u01/app/oracle/product/11.2.0/db_1/network/admin/tnsnames.ora

#Copiar archivo desde servidor remoto por SSH
scp oracle@x.x.x.x:/data/backup/BDBL325_.dmp /data/backup

#MONTAR CARPETA COMPARTIDA
sudo mount x.x.x.x:/nfs_log_sgm /usr/SGM_log/nfs_log_sgm
vi /etc/fstab
x.x.x.x:/nfs_dockers /media/bkdocker                  nfs    defaults        1 0

#Cambiar gateway
route add defalut gw x.x.x.x
	#Otra opcion
	vi /etc/sysconfig/network-scripts/ifcfg-eth0

##RESYNC

rsync --remove-source-files -avzhe ssh --progress --exclude 'app.log' userapp@x.x.x.x:/v1app/server/log/ /usr/GM_log/nfs_log/SERVER >> /home/userapp/rsync/SERVER.log

