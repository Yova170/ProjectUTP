<?php
    require './database.php';

     $ruc       = $_POST['ruc'];
     $tipo      = $_POST['tipo'];
     $nombre    = $_POST['nombre'];
     $tel       = $_POST['tel'];
     $direccion = $_POST['direccion'];
 
     $ins= " INSERT INTO clientes (`ruc`, `tipo`, `nombre`, `tel` , `direccion`) VALUES ('$ruc', '$tipo', '$nombre', '$tel', '$direccion');";
 
     $query = mysqli_query($conn, $ins);
 

?>

<html>
<header>
    <a href="/log/inicio.php";>AvicolaApp</a>
</header>

<h1>CLIENTES</h1>
<head>
        <meta charset="utf-8">
        <title>Aves</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
      
</head>
       

     <div class="botones">
        <form id="bo" action="clientes.php"> <input type="submit" value="CLIENTE REGISTRADO CON EXITO">  </form>
        <link rel="stylesheet" href="style/style.css" >
        
    </div>
   
      

</html>
