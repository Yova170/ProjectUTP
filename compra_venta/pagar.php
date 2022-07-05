<?php
    include 'global/config.php';
    include 'global/conexion.php';
    include 'compra.php';
    include 'templates/cabecera.php';
?>   

<?php
    if($_POST){
        $total=0;
        $SID=session_id();
        $Correo=$_POST['email'];
        //$CANTIDAD=$_POST['CANTIDAD'];
        
        foreach($_SESSION['COMPRA'] as $indice=>$producto ){
            $ID=session_id();
            $total= $total+($producto['PRECIO']*$producto['CANTIDAD']);
        }

        $sentencia=$pdo->prepare("INSERT INTO `ventas` (`IdVenta`, `ClaveTrans`, `Fecha`, `Correo`, `Total`, `Estado`, `cantidad`, `IdProducto`) 
        VALUES (NULL,:ClaveTrans, NOW() ,:Correo,:Total, 'Pendiente',:cantidad,:IdProducto);");

        $sentencia->bindParam(":ClaveTrans",$SID);
        $sentencia->bindParam(":Correo",$Correo);
        $sentencia->bindParam(":Total",$total);
        $sentencia->bindParam(":cantidad",$producto['CANTIDAD']);
        $sentencia->bindParam(":IdProducto",$producto['ID']);

        $sentencia->execute();
       // echo "<h3>".$total."</h3>";
    }
?>

    <div class="jumbotron text-center">
        <h1 class="display-4"> ¡Se estara procesando el pago! </h1>
        <hr class="my-4">
        <p class="lead">Se procesara la cantidad de:
            <h4>
                $<?php echo number_format($total,2);?>
            </h4>
        </p>
        
        <p>La transacción sera mandada a su correo<br>
            <strong>Para aclaraciones : avicolab@gmail.com</strong>
        </p>
    </div>

<?php
include 'templates/pie.php';
?>