<?php
include $_ENV['HOME'] . '/inc/inject.php';

$now = new DateTime();
$now->setTimezone(new DateTimeZone('America/Sao_Paulo'));
$now = $now->format('Y-m-d__H-i-s');


header('Content-type: application/csv');

$filename = $now . '_registro_auditoria.csv';
header("Content-Disposition: attachment; filename=\"$filename\"");

$query = pg_query(getConnection(), "SELECT * FROM registro_auditoria");
$result = pg_fetch_all($query);

if (!$result) {
    echo "An error occurred.\n";
    exit;
}

$keys = array_keys($result[0]);

$out = fopen('php://output', 'w');
fputcsv($out, $keys);

foreach ($result as $row) {
    fputcsv($out, $row);
}

fclose($out);
