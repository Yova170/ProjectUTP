<?php
//funciones de encriptacion para el pedido
define("KEY","ELMASTER");
define("COD","AES-128-ECB");

//conexcion con el servidor
define("SERVIDOR","127.0.0.1:33065");
define("USUARIO","root");
define("PASSWORD","");
define("BD","gallinero");

$servidor="mysql:dbname=".BD.";host=".SERVIDOR;

    try
    {
        $pdo= new PDO($servidor,USUARIO,PASSWORD,
            array(PDO::MYSQL_ATTR_INIT_COMMAND=> "SET NAMES utf8")
        );
       // echo "<script> alert('conectados...')</script>";

    }catch(PDOException $e){
     //   echo "<script> alert('Error...')</script>";
    }

?>