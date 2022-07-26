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

        $sentencia=$pdo->prepare("INSERT INTO `ventas` (`IdVenta`, `ClaveTrans`, `Fecha`, `Correo`, `Total`, `Estado`) 
        VALUES (NULL,:ClaveTrans, NOW() ,:Correo,:Total, 'Pendiente');");

        $sentencia->bindParam(":ClaveTrans",$SID);
        $sentencia->bindParam(":Correo",$Correo);
        $sentencia->bindParam(":Total",$total);
        //$sentencia->bindParam(":cantidad",$producto['CANTIDAD']);
        //$sentencia->bindParam(":IdProducto",$producto['ID']);
        $sentencia->execute();
        $idVenta= $pdo->lastInsertId();

        
        
        foreach($_SESSION['COMPRA'] as $indice=>$producto){
                //$CANTIDAD=$_POST['CANTIDAD'];

            $sentencia=$pdo->prepare("INSERT INTO `detalle_ventas` (`IdDetalle_Venta`, `IdFactura`, `IdProducto`, `IdVenta`, `Cantidad`, `Precio`)
             VALUES (NULL, '',:IdProducto,:IdVenta,:Cantidad, :Precio);");

             $sentencia->bindParam(":IdVenta",$idVenta);
             $sentencia->bindParam(":IdProducto",$producto['ID']);
             $sentencia->bindParam(":Cantidad",$producto['CANTIDAD']);
             $sentencia->bindParam(":Precio",$producto['PRECIO']);

            $sentencia->execute();

            
        //$sentencia->bindParam(":Total",$total);

        }
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