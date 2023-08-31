<?php

include $_ENV['HOME'] . '/inc/inject.php';

$template = $twig->load('pessoas.html');
echo $template->render();
