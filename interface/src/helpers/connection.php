<?php

function getConnection(string $username, string $password) {
    $host = "database";
    $database = "andifes";
    $port = 5432;

    $connString = "host={$host} port={$port} dbname={$database} user={$username} password={$password}";
    $conn = @pg_connect($connString);

    return $conn;
}