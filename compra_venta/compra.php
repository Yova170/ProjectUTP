<?php
session_start();
$mensaje="";

if(isset($_POST['btnAccion'])){

    switch($_POST['btnAccion']){
        case 'agregar':
        //al imbocar las variables de la BD POR FAVOR... Tener cuidado con los ESPACIOS
            if(is_numeric( openssl_decrypt($_POST['id'],COD,KEY))){

                $ID=openssl_decrypt($_POST['id'],COD,KEY);
                $mensaje.="Campos correctos".$ID."<br/>";
            }
            else{
                $mensaje.="Campos incorrectos".$ID."<br/>";
            }

            if(is_string(openssl_decrypt($_POST[ 'nombre'],COD, KEY))){
                $NOMBRE=openssl_decrypt($_POST[ 'nombre'],COD, KEY);
                $mensaje.="Ok NOMBRE" .$NOMBRE."<br/>";
                }else{ $mensaje.="Upps.. algo pasa con el nombre"."<br/>"; break;}

                if(is_numeric(openssl_decrypt($_POST['cantidad'],COD,KEY))){
                    $CANTIDAD=openssl_decrypt($_POST[ 'cantidad'], COD, KEY);
                    $mensaje.="Ok CANTIDAD" .$CANTIDAD."<br/>";
                }else{$mensaje.="Upps.. algo pasa con el cantidad"."<br/>";break;}

                if(is_numeric(openssl_decrypt($_POST['precio'],COD, KEY))){
                    $PRECIO=openssl_decrypt($_POST['precio'],COD, KEY);
                    $mensaje.="Ok precio" .$PRECIO."<br/>";
                }else{ $mensaje.="Upps.. algo pasa con el precio"."<br/>"; break;}

               
                //agregacion para la primera agregacion de compra
                if(!isset($_SESSION['COMPRA'])){ 

                    $producto= array(
                        'ID'=>$ID,
                        'NOMBRE'=>$NOMBRE,
                        'CANTIDAD'=>$CANTIDAD,
                        'PRECIO'=>$PRECIO

                    );
                    $_SESSION['COMPRA'][0]=$producto;

                } 
                else{
                    $NumeroProductos=count($_SESSION['COMPRA']);
                    $producto= array(
                        'ID'=>$ID,
                        'NOMBRE'=>$NOMBRE,
                        'CANTIDAD'=>$CANTIDAD,
                        'PRECIO'=>$PRECIO

                    );
                    //llenado de la compra
                    $_SESSION['COMPRA'][$NumeroProductos]=$producto;
                }
                //$mensaje= print_r($_SESSION,true);
                $mensaje= "Producto agregado a la compra";
        break ;

        //EVALUACION DEL ID PARA LA ELIMINACION DE PRODUCTO
        case "eliminar":
            if(is_numeric(openssl_decrypt($_POST['id'],COD,KEY))){
                $ID=openssl_decrypt($_POST['id'],COD,KEY);

                foreach($_SESSION['COMPRA'] as $indice=>$producto ){

                    if($producto['ID']==$ID){
                        unset($_SESSION['COMPRA'][$indice]);
                        echo "<script>alert('Elemento borrado...')</script>";
                    }
                }


            }
            else{
                $mensaje.="Campos correctos".$ID."<br/>";
            }

        break;


    }
}

?>