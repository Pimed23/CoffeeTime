<?php
    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $precio = (int)$_POST['precio'];
    $image_name = $_FILES['imagen']['name'];
    
    if(isset($image_name) && $image_name != "") {
        $image_type = $_FILES['imagen']['type'];
        $image_tam = $_FILES['imagen']['size'];
        $temp_dest = $_FILES['imagen']['tmp_name'];
        $file_dest = $_SERVER['DOCUMENT_ROOT'].'/CoffeeTime/pictures/';

        if(($image_type == "/Agenda/pictures/jpg" || $image_type == "/Agenda/pictures/jpge" || $image_type == "/Agenda/pictures/png") && ($image_tam < 2000000)) {
            echo '<div><b>Error. La extensión o el tamaño de los archivos no es correcta.<br/>
            - Se permiten archivos .gif, .jpg, .png. y de 200 kb como máximo.</b></div>';
        } else {
            if(move_uploaded_file($temp_dest,$file_dest.$image_name)) {
                chmod($file_dest.$image_name, 0777);
                echo '<div><b>Se ha subido correctamente la imagen.</b></div>';
            } else {
                echo '<div><b>Ocurrió algún error al subir el fichero. No pudo guardarse.</b></div>';
            }
        }
    } else {
        echo "No hay imagen para subir";
    }

    require("conectionDB.php");

    $query_insert = "CALL insertarProducto('$codigo', '$nombre', $precio, '$image_name')";
    if( mysqli_query( $conection, $query_insert ) == false ) {
        echo mysqli_error($conection);
    }
    
    header ("Location: http://localhost/CoffeeTime/ventas.html");
?>
