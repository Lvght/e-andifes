<?php
include $_ENV['HOME'] . '/helpers/get_connection.php';
session_start();

$username = $_POST['username'];
$password = $_POST['password'];

// Conecta com o PostgreSQL
$connection = getConnection($username, $password);

if (! $connection) {
    // Se não conseguir conectar, redireciona para a página de login com uma mensagem de erro.
    // Eu inventei esse valor "500", poderia ser qualquer coisa.
    $erro = "500";
    header("Location: index.php?erro={$erro}");
} else {
    // Se conseguir conectar, redireciona para a página de dashboard.
    $_SESSION['username'] = $username;
    $_SESSION['password'] = $password;
    header("Location: dashboard.php");
}