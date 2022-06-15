<?php
  session_start();

  require 'database.php';

  if (isset($_SESSION['user_id'])) {
    $records = $conn->prepare('SELECT id, email, password FROM users WHERE id = :id');
    $records->bindParam(':id', $_SESSION['user_id']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);

    $user = null;

    if (count($results) > 0) {
      $user = $results;
    }
  }
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title> AvicolApp </title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>

    <header>
    <a href="index.php"> AvicolApp</a>
</header>


    <?php if(!empty($user)): ?>
      <br> Bienvenido <?= $user['']; ?>
      <br> Ha Iniciado Sesion Correctamente
      <a href="logout.php">
        Cerrar Sesion
      </a>
    <?php else: ?>
      <h1>Iniciar Sesion </h1>

      <a href="login.php">Inicar Sesion</a> ,
      <a href="signup.php">Registrarse</a>
    <?php endif; ?>
  </body>
</html>
