<?php
    $db_host = "localhost";
    $db_name = "Coffee";
    $db_user = "root";
    $db_pass = "root";

    $conection = mysqli_connect( $db_host, $db_user, $db_pass );
    
    if( mysqli_connect_errno()) {
        echo mysqli_error($conection);
        exit();
    }
    
    mysqli_select_db( $conection, $db_name ) or die ("No se encuentra la BD");
    mysqli_set_charset( $conection, "utf8" );
?>
