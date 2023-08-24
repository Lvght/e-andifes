<?php

include $_ENV['HOME'] . '/inc/inject.php';

$template = $twig->load('dashboard.twig');
echo $template->render(['username' => $_SESSION['username']]);
