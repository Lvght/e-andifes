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

$template = $twig->load('auditoria/index.html');
echo $template->render();
