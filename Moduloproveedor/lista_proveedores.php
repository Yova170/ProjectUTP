<?php
$enlace = mysqli_connect( 
"localhost", 
"", // Este es mi Usuario... 
"", // Este es mi Clave... 
"bdprueba"); // Esta es mi Base de Datos
if (!$enlace) { 
 echo "Error: No se pudo conectar a MySQL." . PHP_EOL; 
 
 echo "Error de depuración: " . mysqli_connect_error() . PHP_EOL; 
exit; 
} 
?>




<!DOCTYPE html>
<html lang="en">

<head>


  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Bethany - v4.7.0
  * Template URL: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
 <link rel="stylesheet" type = "text/css" href="style/style.css">
 <section id="container">
  
  <h1> Lista de proveedores</h1>
  <a href="Registro_proveedor.php" class="btn_new">Añadir proveedor</a>
   
<?php

$resultado = mysqli_query ($enlace ,'select * from ttproveedores;'); 
$lins = mysqli_num_rows ($resultado); 
if( empty($lins) ){ 
echo '<h1>TABLA VACIA</h1>'; } else { 
 
echo
'<table> 
<tr> 
<th>ID</th> 
<th>Nombre</th> 
<th>Contacto</th> 
<th>Telefono</th> 
<th>Direccion</th>
</tr>'; 

while ($row = mysqli_fetch_assoc ($resultado) ){ 

echo'<tr>  
<td>'.$row['idproveedor'].'</td> 
<td>'.$row['nombrea'].'</td> 
<td>'.$row['contactob'].'</td> 
<td>'.$row['telefonoc'].'</td> 
<td>'.$row['direcciond'].'</td> 
</td>

</tr>'; } echo
'</table>';
mysqli_free_result($resultado); } 
 mysqli_close($enlace); ?> 


</body>
</html>