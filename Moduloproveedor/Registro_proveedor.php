<html> 
<head> 
<title>Sistema: Registro de proveedores</title> 
</head> 
<body> 
<!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" type = "text/css" href="style/style.css">


<form action="Registro_proveedor.php" method ="POST"> 

    <div class="container">
        <h1>Registro de proveedores</h1>
        <p>Todos los campos son obligatorios.</p>
        <hr> 
        <label for="nombrea"><b>Proveedor</b></label>
        <input type="text" placeholder="Ingresar Proveedor" name="nombrea" id="nombrea" required>

        <label for="Contacto_pro"><b>Contacto</b></label>
        <input type="text" placeholder="Ingresar contacto" name="contactob" id="contactob" required>

        <label for="telefonoc"><b>Telefono</b></label>
        <input type="text" placeholder=" Ingrese el numero de telefono" name="telefonoc" id="telefonoc" required>

        <label for="direcciond"><b>Direccion</b></label>
        <input type="text" placeholder="Ingrese la direccion" name="direcciond" id="direcciond" required>

        <button type="submit" class="registerbtn">Registrar proveedor</button>
        <hr>
 
    </div>
</form>  
 


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
if (isset($_POST['nombrea'])){ 
$nombrea=$_POST['nombrea']; 
} 
if (isset($_POST['contactob'])){ 
$contactob = $_POST['contactob']; 
} 
if (isset($_POST['telefonoc'])){ 
$telefonoc = $_POST['telefonoc']; } 
if (isset($_POST['direcciond'])){ 
$direcciond = $_POST['direcciond']; 

/* PROCESO DE CÁLCULOS DE LA PLANILLA 
$segsoc = $salario_mensual * 0.0925; // 9.25% 
$xss = Round ($segsoc, 2); 
$segeduc = $salario_mensual * 0.0125; // 1.25% 
$xse = Round ($segeduc, 2); 
$imprenta = $salario_mensual * 0.1125; // 11.25% 
$xir = Round ($imprenta, 2); 
$tdeduc = $xss + $xse + $xir; 
$salneto = $salario_mensual - $tdeduc;
*/
// PROCESO DE INSERTAR EL REGISTRO A NUESTRA BASE DE DATOS... 
$sql = "INSERT INTO ttproveedores(nombrea, contactob, telefonoc,direcciond) 
 values ('$nombrea','$contactob', '$telefonoc','$direcciond')"; 
if ($enlace->query($sql) === true){ 
echo "<font color='#145A32'>Registro de proveedor...Grabado</font>"; 
}else { 
 die("ERROR...VERIFIQUE..." . $enlace->error); 
} 
} 
?> 
</body> 
</html>