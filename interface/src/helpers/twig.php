<?php

require_once '/var/www/html/vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader('/var/www/html/templates');
$twig = new \Twig\Environment($loader);
