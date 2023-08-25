<?php
include $_ENV['HOME'] . '/inc/inject.php';

$resultado = null;
if (isset($_POST['num1']) && isset($_POST['num2'])) {
    $num1 = $_POST['num1'];
    $num2 = $_POST['num2'];
    
    $query = pg_query(getConnection(), "SELECT fn_soma({$num1}, {$num2})");
    $result = pg_fetch_all($query);

    $resultado = $result[0]['fn_soma'];
}

$template = $twig->load('soma.twig');
echo $template->render(['resultado' => $resultado]);
