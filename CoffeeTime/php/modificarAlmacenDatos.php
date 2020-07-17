<?php
    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $cantidad = $_POST['cantidad'];
    $umbral = $_POST['umbral'];
    $cod_proveedor = $_POST['cod_proveedor'];

    require("conectionDB.php");
    
    $query_update = "CALL actualizarInsumo('$codigo', '$nombre', '$cantidad', '$umbral', '$cod_proveedor');";
    if( mysqli_query( $conection, $query_update ) == false ) {
        mysqli_error( $conection );
    }

    header ("Location: http://localhost/CoffeeTime/almacen.html");
?>