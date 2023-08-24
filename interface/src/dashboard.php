<?php

include "helpers/inject.php";

require_once '/vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader('templates');
$twig = new \Twig\Environment($loader);

$template = $twig->load('dashboard.twig');
echo $template->render(['username' => $_SESSION['username']]);
