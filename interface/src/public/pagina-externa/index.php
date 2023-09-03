<?php

include $_ENV['HOME'] . '/inc/inject.php';

$template = $twig->load('pagina-externa/index.html');
echo $template->render();
