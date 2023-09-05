<?php

include $_ENV['HOME'] . '/inc/inject.php';

$template = $twig->load('fichas/cadastro_tipo_ficha.html');
echo $template->render();
