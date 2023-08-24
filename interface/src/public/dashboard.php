<?php

include $_ENV['HOME'] . '/inc/inject.php';

$query = pg_query(getConnection(), "SELECT * FROM pessoa");
$result = pg_fetch_all($query);

// checks if result is not empty.
if ($result) {
    $keys = array_keys($result[0]);
} else {
    $keys = [];
}

$template = $twig->load('dashboard.twig');
echo $template->render([
    'username' => $_SESSION['username'],
    'pessoas' => $result,
    'keys' => $keys
]);
