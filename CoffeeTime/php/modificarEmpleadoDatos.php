<?php
    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $p_apellido = $_POST['p_apellido'];
    $s_apellido = $_POST['s_apellido'];
    $telefono = $_POST['telefono'];
    $fech_nac = $_POST['fech_nac'];
    $direccion = $_POST['direccion'];
    $cod_jefe = $_POST['cod_jefe'];
    $cargo = $_POST['cargo'];
    
    require("conectionDB.php");
    
    $query_update = "CALL actualizarEmpleado('$codigo', '$nombre', '$p_apellido', '$s_apellido', '$telefono', '$fech_nac', '$direccion', '$cod_jefe', '$cargo')";
    if( mysqli_query( $conection, $query_update ) == false ) {
        mysqli_error( $conection );
    }

    header ("Location: http://localhost/CoffeeTime/empleados.html");
?>