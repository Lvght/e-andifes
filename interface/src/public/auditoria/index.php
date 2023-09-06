<?php

include $_ENV['HOME'] . '/inc/inject.php';

// Verifica se o cargo 'gestor_andifes' consta
if (!in_array('gestor_andifes', $_SESSION['cargos'])) {
    $template = $twig->load('401.html');
    echo $template->render([
        'mensagemErro' => 'Você não possui autorização para isso.'
    ]);
    exit();
}

$query = pg_query(getConnection(), "SELECT * FROM registro_auditoria ORDER BY id DESC");
$result = pg_fetch_all($query);
$template = $twig->load('auditoria/index.html');
echo $template->render(['result' => $result, 'keys' => array_keys($result[0])]);
