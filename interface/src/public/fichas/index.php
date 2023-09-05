<?php

include $_ENV['HOME'] . '/inc/inject.php';

$template = $twig->load('fichas/index.html');
echo $template->render();
