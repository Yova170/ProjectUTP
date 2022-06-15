<?php

  session_start();

  if (isset($_SESSION['user_id'])) {
    header('Location: /php-login');
  }
  require 'database.php';

  if (!empty($_POST['cedula']) && !empty($_POST['password'])) {
    $records = $conn->prepare('SELECT id, cedula, password FROM users WHERE cedula = :cedula');
    $records->bindParam(':cedula', $_POST['cedula']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);

    

    if (count($results) > 0 && password_verify($_POST['password'], $results['password'])) {
      $_SESSION['user_id'] = $results['id'];
      header("Location: /php-login");
    } else {
      $message = 'Los Datos no Coinciden';
    }
  }

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Login</title>
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

    <h1>Inicar Sesion</h1>
    <span><a href="signup.php">Registrarse</a></span>

    <form action="login.php" method="POST">
      <input name="cedula" type="text" placeholder="Ingrese su Cedula">
      <input name="password" type="password" placeholder="Ingrese su Contrasena">
      <input type="submit" value="Iniciar Sesion">
    </form>
  </body>
</html>

</html>
