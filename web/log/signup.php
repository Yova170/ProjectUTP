<?php  
    require 'database.php';
    $message= '';


    if (!empty($_POST['id_cedula']) && !empty($_POST['password']) && !empty($_POST['nombre']) && !empty($_POST['apellido'])) {
        $sql = "INSERT INTO avicultores (id_cedula, nombre, apellido, password) VALUES (:id_cedula, :nombre, :apellido, :password)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id_cedula', $_POST['id_cedula']);
        $stmt->bindParam(':nombre', $_POST['nombre']);
        $stmt->bindParam(':apellido', $_POST['apellido']);
        $stmt->bindParam(':password', $_POST['password']);
    
        if ($stmt->execute()) {
          $message = 'Nuevo usuario creado con éxito';
        } else {
          $message = 'Lo sentimos, ha ocurrido un problema al crear su cuenta';
        }
      }
        


     
?>
<html>
    <head>
        <title>
            Registrarse
        </title>
        <meta charset="utf-8">
            <link href="https://fonts.googleapis.com/css2?family=Nuosu+SIL&family=Poppins:ital,wght@0,400;1,300;1,400&display=swap" rel="stylesheet">
            <link rel="stylesheet" href= "style\css\style.css">
    </head>

    <body>
        <header>
            <a href="/log/inicio.php">AvicolaApp </a>
        </header>
        <?php if(!empty($message)): ?>
         <p> <?= $message ?> </p>
            <?php endif; ?>
        <h1>
            Registrarse
        </h1>
        <a href="login.php">Iniciar sesion</a>

        <form action="signup.php" method="POST">
            <input name="id_cedula" type="text" placeholder="Ingrese su Cedula">
            <input name="npmbre" type="text" placeholder="Ingrese su Nombre">
            <input name="apellido" type="text" placeholder="Ingrese su Apellido">
            <input name="password" type="password" placeholder="Ingrese su Contraseña">
            <input type="submit" value="Registrarse">
        </form>
    </body>
</html>
