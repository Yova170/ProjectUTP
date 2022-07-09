<?php
     require 'database.php';
   
    ?>

<html>
    <header>
        <a href="/log/inicio.php";>AvicolaApp</a>
    </header>

<h1>CLIENTE</h1>
<head>
        <meta charset="utf-8">
        <title>Inventario</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
      
</head>
    <h1>
        Inserte Datos de la Ave 
    </h1>
    <class id="a1">
        <a  href="clientes.php">Volver</a>
       
    </class>
    <body >
        <div >
       
        <form action="save.php" method="POST"> 

            <input  type="text" placeholder="Ingrese RUC del Cliente" name="ruc">  
            <b>Tipo de Cliente</b>
            <select name="tipo" > 
                <option value="NATURAL"> Natural </option>
                <option value="EMPRESA"> Empresa </option>
            </select>
            <input  type="text" placeholder="Ingrese Nombre del Cliente" name="nombre">
            <input  type="text" placeholder="Ingrese Telefono del Cliente" name="tel">
            <input  type="text" placeholder="Ingrese Direccion del Cliente" name="direccion">
            <input type="submit" value="REGISTRAR" action="save.php">
            <link rel="stylesheet" href="style/style.css" >
        </form>
      
        </div>
       

    </body>
</html>