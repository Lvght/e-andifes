<?php

include $_ENV['HOME'] . '/inc/inject.php';

$template = $twig->load('parceiros.html');
echo $template->render();
