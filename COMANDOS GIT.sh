git help

git init 						#Crea un repositorio
git status 						#Indica si hay archivos con cambios
git add archivo.extencion 		#Para añadir el archivo para hacer commit
git add .				 		#Para añadir todo los archivos del proyecto al staged
git commit -m "Mi comentario"	#Para hacer commit
git log							#Para mirar los commit que se han realizado
git commit --amend				#Para modificar el ultimo commit anterior
git checkout -- archivo.extencion				#Para desahacer modificaciones de un archivo
git checkout master								#Nos lleva al ultimo commit
git checkout codigocommit						#Nos lleva al commit que corresponde al codigo indicado

git log --oneline								#Para listar todos los commits con sus codigos
git log --oneline --decorate					#Para listar todos los commits con sus codigos
git log --oneline --decorate --all --graph		#Para listar todos los commits con sus codigos

git reset codigocommit							#Desahace el commit que corresponde al codigo indicado.
git reset HEAD archivo							#Quita un archivo del staged y lo pone en el Working Directory, para no tenerlo en cuenta en el proximo commit.
git reset --hard codigocommit					#Deshace el commit completamente en un solo paso.
git reset --soft codigocommit					#Deshace el commit y deja los cambios en el staged.
git reset --mixed codigocommit					#Deshace el commit y deja los cambios en el Working Directory.

#El comando CLEAN solo borrar los archivos nuevos que no han sido guardado antes con un commit.
git clean -f 						#Sirve para limpiar los cambios que estan en el woking directory. -f foza la operacion
git clean -n 						#muestra los archivos que borrarian del woking directory.

git revert codigocommit				#Elimina todos los commits desde el commit indicado en el comando.

git mv archiv1.txt renombra_archivo1.txt	#Este comando renombra un archivo y lo deja en el staged.
 
#MANIPULACION DE RAMAS

git branch								#Muestra la lista de ramas que tenemos creadas
git branch	nuevarama					#Crea una nueva rama
git branch -m mirama nuevonombre		#Permite renombrar una rama
git branch -d mirama					#Elimina una rama
git checkout nuevarama					#Permite cambiarnos a la rama indicada
git checkout -b nuevarama				#Permite crear una rama y cambiarnos a ella

git merge ramaafucionar		#para funcionar una rama con otra, para que esto funcine debemos primero estar ubicados en la rama destino

#Trabajar con STASH
git stash					#Guarda cambios que estan en woking directory en un bolsillo para que puedas pasarte a otra rama sin hacer commit.
git stash pop				#Toma los cambios que guadaste en el bolsillo y los pone nuevamente en el working directory	
git stash list				#Toma los cambios guardados en el stash
git stash clear				#Borra los cambios guardados en el stash

#Trabajar con TAGS
git tag mitag								#Para crear un tag sencillo.
git tag -a v1.0 -m "Version 1.0"			#Crea un tag anotado, con mas metadata
git tag -a v1.0 -m "Version 1.0" idcommit	#Crea un tag anotado, con mas metadata, y desde un commit indicado.
git tag 									#Lista los tags
git checkout mitag 							#Nos permite movernos a un tag

#Trabajar con REMOTE
git remote		#Listas los repositorios remotos configurados
git remote -v 	#Listas los repositorios remotos configurados con mas detalle
git remote add origin https://github.com/NiconDevTeam/proyectox.git  #Añade un repositorio remoto llamado origin en mi local
git remote remove origin

#Trabajar con el comando FETCH
git fetch origin master			#Descarga el contenido de su repositorio remoto sin mesclar con su repo local como lo hace pull
git checkout origin/master		#Nos permite ver los cambios descargados con el comando anterior
git merge origin/master			#Nos permite convinar los cambios del repo remoto descargados con fetch y los cambios de mi local.

git pull origin master	#Descarga los cambios del repo remoto y los combia con el repo local
git push origin master	#Sube los commits del local al repo remoto
git push origin master --tags	#Sube los tags del local al repo remoto


git show idcommit	#Muestra los cambios del commit.
git show tag		#Muestra los cambios del tag y algunos detalles adicionales.

git diff						#Para mirar los cambios que se han realizado sobre los archivos
git diff idcommit1 idcommit2	#Diferencias entre dos commits

git shortlog	#Muestra los commits que ha realizado cada usuario
git describe	#Muestra el tag anotado (tag -a) mas reciente.

#COMANDOS EXTRAS
git cherry-pick	idcommit	#Permite seleccionar un commit y moverlo a otra rama, el working directory debe estar limpio
							#Debe estar parado en la rama destino
git rebase	#Similar al comando merge pero no se suele utilizar por la forma en que realiza el merge

git blame archivo 			#Permite ver los cambios que han aplicado sobre ese archivo
git blame -L 3 5 archivo 	#Permite ver los cambios que han aplicado sobre ese archivo en la lineas desde la 3 a la 5

git grep -n palabra				#Permite encontrar la palabra indicada en los archivos del repositorio, el flat -n nos entrega la linea especifica
git grep -n palabra idcommit	#Permite encontrar la palabra indicada en los archivos del commit indicado.

# HEAD~ y HEAD^		Formas de llamar al padre de un commit
git checkout HEAD~1 #Seleccionar al primer padre
git checkout HEAD^1 #Seleccionar al segundo padre (para el caso de un commir tipo merge)

#Git HUB
…or create a new repository on the command line
echo "# front-api-rest-01-angular" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/eduardo326/front-api-rest-01-angular.git
git push -u origin main

…or push an existing repository from the command line
git remote add origin https://github.com/eduardo326/front-api-rest-01-angular.git
git branch -M main
git push -u origin main