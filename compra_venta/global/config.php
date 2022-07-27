<?php
//funciones de encriptacion para el pedido
define("KEY","ELMASTER");
define("COD","AES-128-ECB");

//conexcion con el servidor
define("SERVIDOR","localhost:1700");
define("root","usuario");
define("avicoladb","contrasena");
define("gallinero","esquema");

$servidor="mysql:dbname=".gallinero.";host=".SERVIDOR;

    try
    {
        $pdo= new PDO($servidor,root,avicoladb,
            array(PDO::MYSQL_ATTR_INIT_COMMAND=> "SET NAMES utf8")
        );
       // echo "<script> alert('conectados...')</script>";

    }catch(PDOException $e){
     //   echo "<script> alert('Error...')</script>";
    }

?>