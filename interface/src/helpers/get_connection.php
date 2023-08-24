<?php

function getConnection(string $username = null, string $password = null): PgSql\Connection|bool {
    if (! $username || ! $password) {
        $username = $_SESSION['username'];
        $password = $_SESSION['password'];
    }

    if (! $username || ! $password) {
        return false;
    }

    $host = "database";
    $database = "andifes";
    $port = 5432;

    $connString = "host={$host} port={$port} dbname={$database} user={$username} password={$password}";
    return @pg_connect($connString);
}
