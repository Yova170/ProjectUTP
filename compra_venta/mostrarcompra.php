<?php
    include 'global/config.php';
    include 'compra.php';
    include 'templates/cabecera.php';
?>

<br>
<h3>Lista compra</h3>
<?php if(!empty($_SESSION['COMPRA'])) {?>
<table class="table table-bordered">
    <tbody>
        <tr>
            <th width="40%" class="text-center">Descripcion </th>
            <th width="15%" class="text-center">Cantidad</th>
            <th width="20%" class="text-center">Precio</th>
            <th width="20%" class="text-center">Total</th>
            <th width="5%">--</th>
        </tr>
        
        <!--Tabla que muestra el calculo total de la compra-->
        <?php $total=0; ?>
        <?php foreach($_SESSION['COMPRA'] as $indice=>$producto) {?>
        <tr>
            <td width="40%"> <?php echo $producto['NOMBRE']?> </td>
            <td width="15%" class="text-center"> <?php echo $producto['CANTIDAD']?> </td>
            <td width="20%" class="text-center">$<?php echo $producto['PRECIO']?></td>
            <td width="20%" class="text-center">$<?php echo number_format($producto['PRECIO']*$producto['CANTIDAD'],2);?></td>
            
            <td width="5%">
                
            <!--Boton de eliminar-->
            <form action="" method="post">

                <input type="hidden" name="id" id="id" value="<?php echo openssl_encrypt($producto['ID'],COD,KEY);?>">    

                <button class="btn btn-danger" type="submit" name="btnAccion" value="eliminar">
                    Eliminar
                </button>
            </form>

            </td>
            
            

        </tr>
        <?php $total=$total+($producto['PRECIO']*$producto['CANTIDAD']); ?>
        <?php }?>
         
        <tr>
            <td colspan="3" align="right"><h3>Total</h3></td>
            <td align="right"><h3> $<?php echo number_format($total,2);?> </h3></td>
            <td></td>
        </tr>

        <!--Contacto-->
        <tr>
            <td colspan="5">
               <form action="pagar.php" method="post">

               <div class="alert alert-success"> <!--role="alert"-->
               <div class="form-group">
                    <label for="my-input">Correo: </label>
                    <input id="email" class="form-control" type="email" name="email" placeholder="Por favor introduzca correo de contacto" required>
                </div>

                <small id="emailHelp" class="form-text text-muted">
                    Se le contactara por correo
                </small>

               </div> 
                <button class="btn btn-primary btn-lg- btn-block" type="submit" name="btnAccion" value="proceder">
                    Proceder a pagar
                </button>
               </form>
            </td>
        </tr>

    </tbody> 
</table>

<?php } else{ ?>
    <div class="alert alert-success">
        No hay productos en la compra
    </div>

<?php }?>  


<?php
include 'templates/pie.php';
?>