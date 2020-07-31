<?php
    $codigo = $_POST['codigo'];
    
    require("conectionDB.php");
    
    $query = "CALL buscarEmpleado('$codigo')";
    $result = mysqli_query( $conection, $query );

    $json_array = array();

    while( $row = mysqli_fetch_assoc($result)) {    
        $json_array[] = $row;
    }

    echo( json_encode( $json_array));
?>