<?php

	$host = 'localhost';
	$user = 'root';
	$password = '';
	$db = 'bdprueba';

	$conection = @mysqli_connect($host,$user,$password,$db);

	if(!$conection){
		echo "Error en la conexion";

	}else{
		echo "conexion exitosa";

	}

?>