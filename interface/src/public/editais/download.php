<?php

include $_ENV['HOME'] . '/inc/inject.php';

$id = $_GET['id'];
$query = pg_query(getConnection(), "SELECT arquivo FROM edital WHERE id=$id");
$edital = pg_fetch_all($query);

if (!$edital) {
    echo "An error occurred.\n";
    exit;
}

$arquivo = $edital[0]['arquivo'];
$bytes = pg_unescape_bytea($arquivo);
header('Content-type: application/pdf');
header("Content-Disposition: attachment; filename=\"aaaaa.pdf\"");

echo $bytes;