<?php
    $cod_cliente = $_POST['cod_cliente'];
    $monto_total = $_POST['monto_pagado'];
    $efectivo = $_POST['efectivo'];
    $cambio = $_POST['cambio'];
    $fech_ven = $_POST['fech_ven'];
    $forma_pago = $_POST['forma_pago'];
        
    require("conectionDB.php");    
    
    $clave = 'C0';
    
    $query0 = "SHOW TABLE STATUS WHERE Name = 'Facturas';";
    $res1 = mysqli_query( $conection, $query0 );
    $arr1 = mysqli_fetch_row( $res1 );
    $codigo = $clave . $arr1[4];
    
    $query_insert = "CALL insertarFactura('$codigo','$fech_ven','$monto_total','$efectivo','$cambio','$cod_cliente','$forma_pago');";
    if( mysqli_query( $conection, $query_insert ) == false ) {
        echo mysqli_error( $conection );
    }

    header ("Location: http://localhost/CoffeeTime/facturas.html");
?>

