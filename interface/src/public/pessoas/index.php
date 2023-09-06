<?php

include $_ENV['HOME'] . '/inc/inject.php';

try {
    $table = 'view_admin_pessoa';
    $query = pg_query(getConnection(), "SELECT * FROM $table");
    $resultado = pg_fetch_all($query);

    if ($resultado) {
        $keys = array_keys($resultado[0]);
    } else {
        $keys = [];
    }

    $template = $twig->load('pessoas/index.html');
    echo $template->render(['keys' => $keys, 'pessoas' => $resultado]);

    /*
    $query = "SELECT * FROM fn_table_introspect('$table')";
    $campos = executaQueryNoBancoDeDados($query);

    $query = "SELECT * FROM $table LIMIT 1";
    $resultado = executaQueryNoBancoDeDados($query);

    $template = $twig->load('pessoas/index.html');
    // print_r($resultado[0]);
    echo $template->render(['campos' => $campos, 'instancia' => $resultado[0]]);
    */
}

catch (Throwable $e) {
    $error = $e->getMessage();
    
    $template = $twig->load('500.html');
    echo $template->render(['error' => $error]);
}
