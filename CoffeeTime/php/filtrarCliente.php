<?php
    $word = $_POST['filtro'];

    require("conectionDB.php");

    $filtro = $word . '%';
    
    $query = "CALL filtrarCliente('$filtro');";
    $result = mysqli_query( $conection, $query );

    $json_array = array();

    while( $row = mysqli_fetch_assoc($result)) {    
        $json_array[] = $row;
    }
    
    echo( json_encode( $json_array));

?>
