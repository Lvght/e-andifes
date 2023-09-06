<?php

include $_ENV['HOME'] . '/inc/inject.php';

$id = $_GET['id'];

if (!isset($id)) {
    echo "An error occurred.\n";
    exit;
}

$query = pg_query(getConnection(), "SELECT id,nome,data_publicacao FROM edital WHERE id=$id");
$edital = pg_fetch_all($query)[0];

$template = $twig->load('/editais/detalhe.html');
echo $template->render(['edital' => $edital]);