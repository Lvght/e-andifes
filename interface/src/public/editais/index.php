<?php

include $_ENV['HOME'] . '/inc/inject.php';

try {
    $query = pg_query(
        getConnection(),
        "SELECT id, nome, data_publicacao, ano, semestre, publicado_por, criado_em, criado_por FROM edital ORDER BY id DESC"
    );
    $editais = pg_fetch_all($query);

    // Uso o array_merge para inserir os novos valores no começo do array
    $editais = array_map(function ($x) {
        // read link
        $rlink = "/editais/detalhe.php?id={$x['id']}";
        $x = array_merge(['Abrir' => $rlink], $x);
        return $x;
    }, $editais);

    if (isset($_GET['msg'])) {
        $msg = $_GET['msg'];
    } else {
        $msg = null;
    }

    if ($editais) {
        $keys = array_keys($editais[0]);
    } else {
        $keys = [];
    }

    $template = $twig->load('editais_visao_geral.html');
    echo $template->render(['cadastro_ok' => $msg == 'cadastro_ok', 'editais' => $editais, 'keys' => $keys]);
} catch (Throwable $e) {
    echo $e->getMessage();
}
