<?php
session_start();

if (!isset($_SESSION['username']) || !isset($_SESSION['password'])) {
    header("Location: ../index.php");
}

require_once '/var/www/html/vendor/autoload.php';

include $_ENV['HOME'] . "/helpers/get_connection.php";

$loader = new \Twig\Loader\FilesystemLoader($_ENV['HOME'] . '/templates');
$twig = new \Twig\Environment($loader);
