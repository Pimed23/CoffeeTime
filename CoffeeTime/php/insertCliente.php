<?php
    $local = $_POST['local'];
    $nombre = $_POST['nombre'];
    $p_apellido = $_POST['p_apellido'];
    $s_apellido = $_POST['s_apellido'];
    $telefono = $_POST['telefono'];
    $fecha = $_POST['fecha'];
    $hora = $_POST['hora'];

    require("conectionDB.php");

    if($local == 'Bustamante') $clave = 'B0';
    if($local == 'Cercado') $clave = 'C0';
    if($local == 'Miraflores') $clave = 'M0';
    if($local == 'Paucarpata') $clave = 'P0';

    $query0 = "SHOW TABLE STATUS WHERE Name = 'Clientes';";
    $res1 = mysqli_query( $conection, $query0 );
    $arr1 = mysqli_fetch_row( $res1 );
    $codigo = $clave . $arr1[4];
    
    $query_insert0 = "CALL insertarCliente('$codigo','$nombre','$p_apellido','$s_apellido','$telefono');";
    if( mysqli_query( $conection, $query_insert0 ) == false ) {
        echo mysqli_error( $conection );
    }

    $query1 = "SHOW TABLE STATUS WHERE Name = 'Reservaciones';";
    $res2 = mysqli_query( $conection, $query1 );
    $arr2 = mysqli_fetch_row( $res2 );
    $reserva = $clave . $arr2[4];

    $query_insert1 = "CALL insertarReservacion('$reserva','$fecha','$hora','$codigo');";
    if( mysqli_query( $conection, $query_insert1 ) == false ) {
        echo mysqli_error( $conection );
    }

    header ("Location: http://localhost/CoffeeTime/");
?>
