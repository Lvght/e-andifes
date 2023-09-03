<?php

include $_ENV['HOME'] . '/inc/inject.php';

$template = $twig->load('editais_visao_geral.html');
echo $template->render();
