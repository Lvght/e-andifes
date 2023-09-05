<?php

include $_ENV['HOME'] . '/inc/inject.php';
// Envia a página de template
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    include $_ENV['HOME'] . '/helpers/twig.php';
    //echo $template->render(['erro' => $_GET['erro'] ?? null, 'test' => 'test']);

    try {
        $template = $twig->load('login.html');
        $table = 'editais_abertos';
        $query = "SELECT * FROM $table";
        $campos = executaQueryNoBancoDeDados($query);
        echo $template->render(['erro' => $_GET['erro'] ?? null, 'test' => 'test', 'editais' => $campos]);
    }
    
    catch (Throwable $e) {
        $error = $e->getMessage();
        
        $template = $twig->load('500.html');
        echo $template->render(['error' => $error]);
    }
}

// Recebe os dados do formulário
else {
    if (!isset($_POST['username']) || !isset($_POST['password']))
    {
        header('Location: /login.php?erro=400_bad_request');
    }

    // Conecta com o banco de dados
    include $_ENV['HOME'] . '/helpers/get_connection.php';
    $conn = getConnection($_POST['username'], $_POST['password']);

    // A conexão falhou. Precisamos descobrir por que
    if (!$conn) {
        $conn = getConnection('postgres', 'postgres');

        if (!$conn) {
            header('Location: /login.php?erro=500_internal_server_error');
            exit();
        }

        header('Location: /login.php?erro=401_unauthorized');
        exit();
    }
    else {
        session_start();
        // Se a conexão foi bem sucedida, obtém os dados do usuário.
        $query = pg_query($conn, "SELECT * FROM fn_who_am_i()");
        $result = pg_fetch_assoc($query);
        $_SESSION['name'] = $result['nome'];

        $query = pg_query($conn, "SELECT * FROM fn_get_my_roles()");
        $result = pg_fetch_all($query);
        $_SESSION['cargos'] = array_column($result, 'role_name');

        $_SESSION['username'] = $_POST['username'];
        $_SESSION['password'] = $_POST['password'];
        header('Location: /dashboard.php');
    }
}
