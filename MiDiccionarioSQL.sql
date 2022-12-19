
--Generar fecha de servidor
select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS')  FROM DUAL;

--Borrar esquema de base de datos
drop user ESQUEMA cascade;


-- Exportar bases de datos
expdp user/password schemas=ESQUEMA directory=DATA_PUMP_DIR dumpfile=HIST.dmp logfile=EXPHIST.log

--Importar archivos .dmp con el usuario oracle
impdp user/password directory=DATA_PUMP_MOVICONT dumpfile=movicont_temp_03122019.dmp table_exists_action=append log=imp_giropen.log
impdp userid="' /AS SYSDBA'" directory=DATA_PUMP_MOVICONT dumpfile=movicont_temp_03122019.dmp table_exists_action=append log=imp_giropen.log
--Consultar en la tabla MOVICONT_TEMP


--Redimencionar tablespace
select 'alter database datafile '''||file_name||''' resize ' ||
ceil( (nvl(hwm,1)*8192)/1024/1024 ) || 'm;' cmd
from dba_data_files a,
( select file_id, max(block_id+blocks-1) hwm
from dba_extents
group by file_id ) b
where a.file_id = b.file_id(+)
and ceil( blocks*8192/1024/1024) -
ceil( (nvl(hwm,1)*8192)/1024/1024 ) > 0
/

imp 'USER/PASSWORD' FILE=/u04/backup/tbl_03122019.dmp  FULL=y

--version de moor d ebase de datos
select * from v$version;


--Ingresar a Oracle sin tener usuario por consola
sqlplus / as sysdba
--reinicio de claves y desbloqueo de usuario
ALTER USER "USER" IDENTIFIED BY "password";
ALTER USER "USER" ACCOUNT UNLOCK;

--Creart sinonimos
CREATE PUBLIC SYNONYM PKG_USUARIO_TRA FOR SETA.PKG_USUARIO_TRA


--------------------------------

---CONSULTAR NOMBRE SID DE BASE DE DATOS
select sysdate, name from v$database;
