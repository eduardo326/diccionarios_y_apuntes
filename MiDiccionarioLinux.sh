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
	tar -czvf /v1app/sockets/SocketNewSIMS.tar.gz /v1app/sockets/SocketNewSIMS
	#Descomprimir: 
	tar -xzvf /opt/Apps/openjdk-1.8.0.tar.gz

	#Archivos .tar:
	#Empaquetar: 
	tar -cvf paquete.tar /dir/a/comprimir/
	#Desempaquetar: 
	tar -xvf Socket_20009.tar

	#Archivos .gz:
	#Comprimir: 
	gzip -9 index.php
	#Descomprimir: 
	gzip -d movicont_temp_03122019.dmp.gz

	#Archivos .zip:
	#Comprimir: 
	zip archivo.zip carpeta
	#Descomprimir: 
	unzip SocketIndra.zip
	
#Levantar conexion VNC
vncserver :2

#Copiar y cortar archivos
mv Lib/* /usr/local/lib
cp /v1app/app_pruebasafis/WEBAFIS_COPMAY2020/linux/libsgfdu05.so /usr/local/lib

#Crear enlaces simbolicos
ln -s archivoreal archivosimbolico


#ADMINISTRACION DE SOCKETS
#Monitoreo de log del socket:
tail -f 21082020_23.log ENTER

#Verificar arriba:
ps aux | grep Nom_carpeta_Socket

#Subir el socket ingresando a la carpeta del Socket:
sh SocketServerSIMS2010.sh & ENTER

#bajar el socket:
kill -9 SID_DE_SESION ENTER
o usar el archivo Kill que se encuentra dentro de la carpeta del socket

#Exportar base de datos con datapum
expdp system/oracle_4U schemas=SIMS directory=DIR_IMPORTS dumpfile=BDBL35_HIST.dmp logfile=EXPHIST.log

expdp sims/SOCKET PARFILE = '/u04/backup/exptables.par'

#Importar contenido de tablas con datapum
impdp sims/vmvRK7inY3xqhCvqfkVd directory=DATA_PUMP_DIR dumpfile=GIROPEND_28122017.dmp table_exists_action=append log=imp_giropen.log
 
impdp sims/5y5t3m.sims directory=DATA_IMPORT dumpfile=EXPDATASIMS20200818.dmp table_exists_action=append log="imp_datasims.log"


#IMPORT SGM
impdp userid="' /AS SYSDBA'" full=Y directory=DATA_PUMP_DIR dumpfile=BDBL325_.dmp logfile="impsgm09112020.log"

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
scp oracle@10.19.44.9:/data/backup/BDBL325_.dmp /data/backup

#MONTAR CARPETA COMPARTIDA
sudo mount 172.23.3.16:/nfs_log_sgm /usr/SGM_log/nfs_log_sgm
vi /etc/fstab
172.23.3.16:/nfs_dockers /media/bkdocker                  nfs    defaults        1 0

#Cambiar gateway
route add defalut gw 10.19.44.180
	#Otra opcion
	vi /etc/sysconfig/network-scripts/ifcfg-eth0

##RESYNC

rsync --remove-source-files -avzhe ssh --progress --exclude 'app.log' userapp@10.96.149.31:/v1app/dmserver/log/ /usr/SGM_log/nfs_log_sgm/NIMBUS_DMSERVER >> /home/userapp/rsync/NIMBUS_DMSERVER.log
rsync --remove-source-files -avzhe ssh --progress --exclude 'logs.log' userapp@10.96.151.32:/v1app/glassfish5/logs/rest/ /usr/SGM_log/nfs_log_sgm/NIMBUS_DMREST >> /home/userapp/rsync/NIMBUS_DMREST.log
rsync --remove-source-files -avzhe ssh --progress --exclude 'server.log' userapp@10.96.151.32:/v1app/glassfish5/glassfish/nodes/localhost-rest/Dinero/logs/ /usr/SGM_log/nfs_log_sgm/NIMBUS_DMREST2 >> /home/userapp/rsync/NIMBUS_DMREST2.log

rsync --remove-source-files -avzhe ssh --progress --exclude 'app.log' userapp@10.86.142.31:/v1app/dmserver/log/ /usr/SGM_log/nfs_log_sgm/TRIARA_DMSERVER >> /home/userapp/rsync/TRIARA_DMSERVER.log
rsync --remove-source-files -avzhe ssh --progress --exclude 'logs.log' userapp@10.86.144.32:/v1app/glassfish5/logs/rest/ /usr/SGM_log/nfs_log_sgm/TRIARA_DMREST >> /home/userapp/rsync/TRIARA_DMREST.log
rsync --remove-source-files -avzhe ssh --progress --exclude 'server.log' userapp@10.86.144.32:/v1app/glassfish5/glassfish/nodes/localhost-domain1/Dinero/logs/ /usr/SGM_log/nfs_log_sgm/TRIARA_DMREST2 >> /home/userapp/rsync/TRIARA_DMREST2.log
