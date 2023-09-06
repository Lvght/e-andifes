<?php

// SEMPRE INCLUA ISSO.
include $_ENV['HOME'] . '/inc/inject.php';

$template = $twig->load('dashboard.html');
echo $template->render();
