<?php
    include 'global/config.php';
    include 'global/conexion.php';
    include 'compra.php';
    include 'templates/cabecera.php';
?>   
        <br> 

        <?php if($mensaje!="") {?>
        <div class="alert alert-success">
        <?php echo $mensaje;?>
            
            <a href="mostrarcompra.php" class="badge badge-succes">Ver compra</a>
        </div>
        <?php }?>

        <div class="row">

            <?php
                $sentencia=$pdo->prepare("SELECT * FROM `productos`");
                $sentencia->execute();
                $listaProductos=$sentencia->fetchALL(PDO::FETCH_ASSOC);
                //print_r($listaProductos);
            ?>


           <!-- consulta a la bd para desplegar los productos-->
           <?php foreach($listaProductos as $producto){?>
            <div class="col-3">
                <div class="card">
                   <!-- Imagen del producto-->
                <img 
                    title="<?php echo $producto['NombreProducto'];?>"
                    alt="<?php echo $producto['NombreProducto'];?>"
                    class="card-img-top" 
                    src="<?php echo $producto['Imagen'];?>" 
                    data-toggle="popover"
                    data-trigger="hover"
                    data-content="<?php echo $producto['DescripProducto'];?>"
                    height="317px"
                    >
                    
                    <!--Informacion del producto-->
                    <div class="card-body">
                        <span><?php echo $producto['NombreProducto'];?></span>
                        <h5 class="card-title">$<?php echo $producto['Precio'];?></h5>
                        <p class="card-text">Descripcion</p>

                         <!--Formulario para los pedidos-->

                        <form action="" method="post">

                        <input type="hidden" name="id" id="id" value="<?php echo openssl_encrypt($producto['IdProducto'],COD,KEY);?>" >
                        <input type="hidden" name="nombre" id="nombre" value="<?php echo openssl_encrypt($producto['NombreProducto'],COD,KEY);?>">
                        <input type="hidden" name="precio" id="precio" value="<?php echo openssl_encrypt($producto['Precio'],COD,KEY);?>">
                        <input type="hidden" name="cantidad" id="cantidad" value="<?php echo openssl_encrypt(1,COD,KEY);?>">
                           
                            <button class="btn btn-primary" name="btnAccion" value="agregar" type="submit">
                            agregar producto
                        </button>

                        </form>

                        

                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>

    <!--Popover para la descripcion de los productos-->
    <script>
        $(function () {
  $('[data-toggle="popover"]').popover()
  });
    </script>

<!--inclusion pie de pagina -->
<?php
include 'templates/pie.php';
?>