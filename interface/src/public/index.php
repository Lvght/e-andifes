<?php
/**
 * Este arquivo carrega o Twig e envia o template HTML da página inicial.
 * Ele também checa se há memsagens de erro enviadas através do método GET.
 */


session_start();

// Verifica se já há uma sessão ativa.
if (isset($_SESSION['username']) && isset($_SESSION['password'])) {
    header('Location: /dashboard.php');
    exit();
}

include $_ENV['HOME'] . '/helpers/twig.php';

$template = $twig->load('index.html');

// Verifica se essa página foi invocada por outra com uma mensagem de erro.
$errorMessage = null;
if (isset($_GET['erro'])) {
    $errorMessage = 'Ocorreu um erro ao se conectar com o banco de dados...';
}

echo $template->render(['message' => 'test', 'errorMessage' => $errorMessage]);
