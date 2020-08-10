<?php
    $insumo = $_POST['id_insumo'];
    $cantidad = $_POST['cantidad'];
    $precio = $_POST['precio'];
    $fecha = $_POST['fech_ped'];
    $local = $_POST['local'];

    require("conectionDB.php");

    if($local == 'JLB') $clave = 'B0';
    if($local == 'CER') $clave = 'C0';
    if($local == 'MIR') $clave = 'M0';
    if($local == 'PAU') $clave = 'P0';

    $query = "SHOW TABLE STATUS WHERE Name = 'Pedidos';";
    $res1 = mysqli_query( $conection, $query );
    $arr1 = mysqli_fetch_row( $res1 );
    $codigo = $clave . $arr1[4];
    
    $query_insert = "CALL insertarPedido('$codigo','$fecha','$cantidad','$precio','$local','$insumo');";
    if( mysqli_query( $conection, $query_insert ) == false ) {
        echo mysqli_error( $conection );
    }

    header ("Location: http://localhost/CoffeeTime/pedidos.html");
?>
