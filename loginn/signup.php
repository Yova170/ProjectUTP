<?php

  require 'database.php';

  $message = '';

  if (!empty($_POST['cedula']) && !empty($_POST['password'])) {
    $sql = "INSERT INTO users (cedula, password) VALUES (:cedula, :password)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cedula', $_POST['cedula']);
    $stmt->bindParam(':password', $_POST['password']);
  

    if ($stmt->execute()) {
      $message = 'Usuario Creado con Exito';
    } else {
      $message = 'Ha Habido un Problema al Crear su Cuenta';
    }
  }
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Registrarse</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>

    <header>
    <a href="index.php"> AvicolApp</a>
    </header>


    <?php if(!empty($message)): ?>
      <p> <?= $message ?></p>
    <?php endif; ?>

    <h1>Registrarse</h1>
    <span><a href="login.php">Iniciar Sesion</a></span>

    <form action="signup.php" method="POST">
      <input name="cedula" type="text" placeholder="Ingrese su Cedula">
      <input name="password" type="password" placeholder="ingrese su Contrasena">
      <input name="confirm_password" type="password" placeholder="Confirme su Contrasena">
      <input type="submit" value="Registrarse">
    </form>

  </body>
</html>