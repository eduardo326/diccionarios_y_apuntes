#Crear componente por consola

#component
ng g c components/auth/panel_base

#service
# --flat no permite crear un directorio extra
ng g s components/pages/usuarios/login --flat=true
ng generate service hero

clase
ng g class ruta/nombreclase

Crear archivo de rutas
ng generate module app-routing --flat --module=app

Para crear guards
ng g g components/pages/usuarios/guards/auth


Construir proyecto para produccion
ng build --prod


Intalar bootstrap, jquery y popper
npm i bootstrap jquery popper.js --save

Instalar dependencia spara websockets
npm i @stomp/stompjs --save
npm i sockjs-client --save

Instalar los tipos para sockjs
npm i @types/sockjs-client --save-dev

