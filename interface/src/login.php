<?php
session_start();

$username = $_POST['username'];
$password = $_POST['password'];

// Conecta-se ao banco de dados.
$host = "database";
$database = "andifes";
$port = 5432;

$connString = "host={$host} port={$port} dbname={$database} user={$username} password={$password}";
$connection = @pg_connect($connString);

if (! $connection) {
    // Se não conseguir conectar, redireciona para a página de login com uma mensagem de erro.
    $_SESSION['login_error'] = "Usuário ou senha incorretos.";
    header("Location: index.php");
} else {
    // Se conseguir conectar, redireciona para a página de dashboard.
    $_SESSION['username'] = $username;
    $_SESSION['password'] = $password;
    header("Location: dashboard.php");
}