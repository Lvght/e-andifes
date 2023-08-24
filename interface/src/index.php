<?php
session_start();

require_once '/vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader('templates');
$twig = new \Twig\Environment($loader);

$template = $twig->load('index.twig');
$hasError = $_GET['e'];
echo $template->render(['message' => 'test', 'hasError' => $hasError]);
