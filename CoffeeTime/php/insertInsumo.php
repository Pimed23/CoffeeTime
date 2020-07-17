<?php
    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $cantidad = (int)$_POST['cantidad'];
    $umbral = (int)$_POST['umbral'];
    $cod_prov = $_POST['cod_prov'];
    
    require("conectionDB.php");

    $query_select = "CALL buscarInsumo($codigo);";
    $res0 = mysqli_query( $conection, $query_select );
    $arr0 = mysqli_fetch_row( $res0 );
    if( $arr0[0] != NULL ) {
        echo "-1";
    } else {
        $query_insert = "CALL insertarInsumo('$codigo', '$nombre', $cantidad, $umbral, '$cod_prov')";
        if( mysqli_query( $conection, $query_insert ) == false ) {
            echo "No se inserto el insumo...";
        }
    }
?>
