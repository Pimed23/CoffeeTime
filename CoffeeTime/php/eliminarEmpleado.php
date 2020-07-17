<?php
    $codigo = $_POST['codigo'];

    require("conectionDB.php");
        
    $query_insert = "CALL eliminarEmpleado('$codigo');";
    if( mysqli_query( $conection, $query_insert ) == false ) {
        echo mysqli_error( $conection );
    }
    header ("Location: http://localhost/CoffeeTime/empleados.html");

?>
