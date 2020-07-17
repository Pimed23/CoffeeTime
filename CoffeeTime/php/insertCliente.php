<?php
    $nombre = $_POST['nombre'];
    $p_apellido = $_POST['p_apellido'];
    $s_apellido = $_POST['s_apellido'];
    $telefono = $_POST['telefono'];

    require("conectionDB.php");

    $query = "SHOW TABLE STATUS WHERE Name = 'Clientes';";
    $res1 = mysqli_query( $conection, $query );
    $arr1 = mysqli_fetch_row( $res1 );
    $codigo = 'MI' . $arr1[4];

    $query_insert = "CALL insertarCliente('$codigo','$nombre','$p_apellido','$s_apellido','$telefono')";
    if( mysqli_query( $conection, $query_insert ) == false ) {
        echo mysqli_error( $conection );
    }

?>
