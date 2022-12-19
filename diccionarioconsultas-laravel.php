<?php 

// Consultas complejas con envio de parametros a las funciones internas
$sedes = DB::table('ins_institucion')
            ->join('inst_aniolectivoxsede', 'inst_aniolectivoxsede.institucion_id', '=', 'ins_institucion.id')
            ->where('institucionpadre_id', $this->auth->user()->institucion_id)
            ->where('aniolectivo_id', $anio->id)
            ->orWhere(function ($query) use ($anio, $institucionpadre){
                $query->where('id', '=', $institucionpadre)
                ->where('aniolectivo_id', $anio->id);
            })
            ->get();

//CONSULTAS CON JOIN DE TABLAS CON LLAVES COMPUESTAS
$data = Inscripciones::where('grado_institucion_id', $this->auth->user()->tercero->institucion_id)
                            ->join('idx_terceros', 'idx_terceros.id', '=', 'tercero_id')
                            ->join('idx_grados', function ($join) {
                                $join->on('grado_grado_id', '=', 'idx_grados.grado')
                                     ->on('grado_institucion_id', '=', 'idx_grados.institucion_id');})
                            ->where('documento', 'like', '%'.$request->search.'%')
                            ->orWhere('name', 'like', '%'.$request->search.'%')->paginate(15);


//CONSULTAS CON JOINS Y SELECTOR DE COLUMNAS
$resultado = DB::table('pm_tareas')
            ->join('pm_listadetareas', 'pm_tareas.listadetareas_id', '=', 'pm_listadetareas.id')
            ->join('pm_proyectos', 'pm_proyectos.id', '=', 'pm_listadetareas.proyecto_id')
            ->where('user_id', $user->id)
            ->select('pm_tareas.*', 'pm_proyectos.proyecto')
            ->paginate(10);
"http://desarrollowebtutorial.com/laravel-eloquent-orm-query-builder-consultas-sql/"


// AGREGAR COLUMNA A DATABLES DESDE LARAVEL
"https://yajrabox.com/docs/laravel-datatables/master/add-column"

$rutacrud=$this->prefix."/".$this->ruta;

            return Datatables::collection($registros)
                    ->addColumn('rutaedit', function(WPICurso $dato) use ($rutacrud){
                        return $rutacrud."/".$dato->curso."|".$dato->curso."|".$dato->sede_institucion_id."/edit";
                    })
                    ->addColumn('rutadelet', function(WPICurso $dato) use ($rutacrud){
                        return $rutacrud."/".$dato->curso."|".$dato->curso."|".$dato->sede_institucion_id;
                    })
                    ->make(true);



// DOCUMENTACION PARA HACER LOGIN CON CAMPOS DIFERENTES A EMAIL
"https://yantb.com/programacion/laravel/login-username-email-campo/"
"https://soleguia.es/login-email-username-laravel5/"



// COMANDOS ARTISAN
php artisan make:provider JwtAuthServiceProvider
php artisan make:controller ApiRest/AuthLogin


 ?>