<?php
include "helpers/inject.php";

$resultado = null;
if (isset($_POST['num1']) && isset($_POST['num2'])) {
    $num1 = $_POST['num1'];
    $num2 = $_POST['num2'];
    
    $query = pg_query($connection, "SELECT fn_soma({$num1}, {$num2})");
    $result = pg_fetch_all($query);

    $resultado = $result[0]['fn_soma'];
}

require_once '/vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader('templates');
$twig = new \Twig\Environment($loader);

$template = $twig->load('soma.twig');
echo $template->render(['resultado' => $resultado]);
