<?php

  session_start();

  if (isset($_SESSION['user_id'])) {
    header('Location: /php-login');
  }
  require 'database.php';

  if (!empty($_POST['id_cedula']) && !empty($_POST['password'])) {
    $records = $conn->prepare('SELECT nombre, id_cedula, password FROM avicultores WHERE id_cedula = :id_cedula');
    $records->bindParam(':id_cedula', $_POST['id_cedula']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);

    $message = '';

    if (count($results) > 0 && password_verify($_POST['password'], $results['password'])) {
      $_SESSION['id_cedula'] = $results['id_cedula'];
      header("Location: /log");
    } else {
      $message = 'Los Datos no Coinciden';
    }
  }

?>
<html>
    <head>
        <title>
            Iniciar Sesion
        </title>
        <meta charset="utf-8">
            <link href="https://fonts.googleapis.com/css2?family=Nuosu+SIL&family=Poppins:ital,wght@0,400;1,300;1,400&display=swap" rel="stylesheet">
            <link rel="stylesheet" href= "style\css\style.css">
    </head>

    <body>
        <header>
            <a href="/log/inicio.php">AvicolaApp </a>
        </header>
        <h1>
            Iniciar Sesion
        </h1>
 
        <form action="login.php" method="POST">
            <input name="id_cedula" type="text" placeholder="Ingrese su Cedula">
            <input name="password" type="password" placeholder="Ingrese su Contraseña">
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>