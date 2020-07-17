<?php
    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $p_apellido = $_POST['p_apellido'];
    $s_apellido = $_POST['s_apellido'];
    $telefono = $_POST['telefono'];

    require("conectionDB.php");
    
    $query_update = "CALL actualizarCliente('$codigo', '$nombre', '$p_apellido', '$s_apellido', '$telefono');";
    if( mysqli_query( $conection, $query_update ) == false ) {
        mysqli_error( $conection );
    }

    header ("Location: http://localhost/CoffeeTime/clientes.html");

?>