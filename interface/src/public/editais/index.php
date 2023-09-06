<?php

include $_ENV['HOME'] . '/inc/inject.php';

if (isset($_GET['msg'])) {
    $msg = $_GET['msg'];
} else {
    $msg = null;
}

$template = $twig->load('editais_visao_geral.html');
echo $template->render(['cadastro_ok' => $msg == 'cadastro_ok']);
