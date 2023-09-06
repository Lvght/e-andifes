<?php

include $_ENV['HOME'] . '/inc/inject.php';

$template = $twig->load('parceiros/index.html');
echo $template->render();
