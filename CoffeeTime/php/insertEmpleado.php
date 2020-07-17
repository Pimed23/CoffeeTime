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

    $query_select = "CALL buscarEmpleado($codigo);";
    $res0 = mysqli_query( $conection, $query_select );
    $arr0 = mysqli_fetch_row( $res0 );
    if( $arr0[0] != NULL ) {
        echo "-1";
    } else {
        $query_insert = "CALL insertarEmpleado('$codigo', '$nombre', '$p_apellido', '$s_apellido', '$telefono', '$fech_nac', '$direccion', '$cod_jefe', '$cargo', 'MIR')";
        if( mysqli_query( $conection, $query_insert ) == false ) {
            echo "No se inserto el empleado...";
        }
    }
    header ("Location: http://localhost/CoffeeTime/empleados.html");
?>
