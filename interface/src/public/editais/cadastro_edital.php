<?php

include $_ENV['HOME'] . '/inc/inject.php';

$template = $twig->load('editais_cadastro.html');
echo $template->render();
