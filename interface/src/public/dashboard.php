<?php

include $_ENV['HOME'] . '/inc/inject.php';

try {
    $query = @pg_query(getConnection(), "SELECT * FROM view_admin_pessoa");
    if (!$query) throw new Exception("Não foi possível executar a query. " . pg_last_error(getConnection()) . "\n");
    $result = @pg_fetch_all($query);
} catch (Throwable $e) {
    $error = $e->getMessage();
    $result = [];
}

// checks if result is not empty.
if ($result) {
    $keys = array_keys($result[0]);
} else {
    $keys = [];
}

$template = $twig->load('dashboard.twig');
$props = [
    'username' => $_SESSION['username'],
    'pessoas' => $result,
    'keys' => $keys
];

if (isset($error)) {
    $props['error'] = $error;
}

echo $template->render($props);
