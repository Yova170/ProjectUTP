<?php
    require 'database.php';
    $buscar=$_POST['buscar'];
?>

<htmnl>
    <header>
     <a href="/log/inicio.php";>AvicolaApp</a>
    </header>

    <h1>CLIENTES</h1>
<head>
        <meta charset="utf-8">
        <title>Inventario</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
      
</head>
    <class id="va">
        <a  href="../index.php">Volver</a>
        <a  href="add.php">Anadir</a>
    </class>
        
    <form id="as" action="buscar.php" method="POST">
        <input type="text" placeholder="Buscar" name="buscar" > 
        <input  type="submit" value="BUSCAR" id="buscar">
        <link rel="stylesheet" href="style/style.css" >
    </form>
    
    <div id="tabla">
        <table border="3" id="customers">

        
        <tr>
            <thead>
                <th> Id Cliente </th>
                <th> RUC </th>
                <th> Tipo </th>
                <th> Nombre </th>
                <th> Telefono </th>
                <th> Direccion </th>
            </thead>
           

        </tr>

            <?php
         
             $sql="SELECT * FROM clientes WHERE id_cliente LIKE '%$buscar%' or ruc  LIKE '%$buscar%' or tipo LIKE '%$buscar%' OR nombre LIKE '%$buscar%' OR tel LIKE '%$buscar%' OR direccion LIKE '%$buscar%' ";
             $result =mysqli_query($conn,$sql );

             while($mostrar= mysqli_fetch_array($result)) {             
            ?>

            <tr>
            <td> <?php echo $mostrar ['id_cliente'] ?> </td>
            <td> <?php echo $mostrar ['ruc'] ?> </td>
            <td> <?php echo $mostrar ['tipo'] ?> </td>
            <td> <?php echo $mostrar ['nombre'] ?> </td>
            <td> <?php echo $mostrar ['tel'] ?> </td>
            <td> <?php echo $mostrar ['direccion'] ?> </td> 
            </tr>

            <?php
             }
            ?>
            <link rel="stylesheet" href="style/style.css" >
        </table>
    </div>
    
</htmnl>