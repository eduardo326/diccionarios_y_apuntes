
--Generar fecha de servidor
select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS')  FROM DUAL;

--Borrar esquema de base de datos
drop user SIMS cascade;


-- Reincio de usuarios por bloqueo por inactividad
UPDATE CONEUSUA
SET COUSFECH = TO_DATE('10/03/2017','dd/mm/yyyy'),
COUSFESI = TO_DATE('10/03/2017','dd/mm/yyyy');
COMMIT;

--Cracion de tablespace
   CREATE TABLESPACE "ORAFISIDX" DATAFILE 
  '/data/u02/oradata/BDSG06/datafiles/APPIDX.dbf' SIZE 128M
  AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
  

CREATE OR REPLACE DIRECTORY DATA_PUMP_DIR_SIMS AS ‘/data/u04’;
  
-- IMPORTAR MOVICONT
--Descomprimir con el usuario usergiros
gzip -d movicont_temp_03122019.dmp.gza

-- Exportar bases de datos
expdp system/oracle_4U schemas=SIMS directory=DATA_PUMP_DIR_SIMS dumpfile=BDSG08_HIST.dmp logfile=EXPHIST.log

--Importar archivos .dmp con el usuario oracle
impdp sims/sims.123 directory=DATA_PUMP_MOVICONT dumpfile=movicont_temp_03122019.dmp table_exists_action=append log=imp_giropen.log
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

imp 'SIMS/xBlbysUdals8S2tdV7xG' FILE=/u04/backup/movicont_temp_03122019.dmp  FULL=y

--version de moor d ebase de datos
select * from v$version;


--Ingresar a Oracle sin tener usuario por consola
sqlplus / as sysdba
--reinicio de claves y desbloqueo de usuario
ALTER USER "ORAFIS" IDENTIFIED BY "oracle_4U";
ALTER USER "SIMS" ACCOUNT UNLOCK;

--Creart sinonimos
CREATE PUBLIC SYNONYM PKG_USUARIO_TRA FOR SETA.PKG_USUARIO_TRA


-- Scripts para correr secuencias
DROP SEQUENCE SIMS.SEQ_PLANES_TARIFARIOS;

CREATE SEQUENCE SIMS.SEQ_PLANES_TARIFARIOS
  START WITH 80572
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;

--------------------------------

---CONSULTAR NOMBRE SID DE BASE DE DATOS
select sysdate, name from v$database;



--- RECALCULO DE GIROSPENDIENTES
BEGIN
EXECUTE IMMEDIATE ('TRUNCATE TABLE GIROPEND');
EXECUTE IMMEDIATE ('TRUNCATE TABLE SALDMOGI');
PKGN_GIROPEND.prdb_GeneraPinesPend (to_date('01/01/2019','dd/mm/yyyy'));
PKGN_GIROPEND.prdb_GeneraPinesPend (trunc(sysdate) - 1);
PKGN_SALDMOGI_HIST.prdb_CalMoviGiros (trunc(sysdate) - 1);
END;


-- MODIFICAR VALORES DE SELECT * FROM NLS_DATABASE_PARAMETERS;
UPDATE PROPS$ SET VALUE$ = 'DD/MM/YYYY' WHERE NAME = 'NLS_DATE_FORMAT';
-- MODIFICAR VALORES DE SELECT * FROM NLS_INSTANCE_PARAMETERS;
alter system set NLS_TERRITORY='AMERICA' scope=spfile;
--- se debe reiniciar el motor de base de datos despues del cambio