<?php
include $_ENV['HOME'] . '/helpers/twig.php';
// Envia a página de template
if ($_SERVER['REQUEST_METHOD'] == 'GET') {

    try {

        /* tive que fazer desse jeito, pois o método 'executaQueryNoBancoDeDados'
        verifica se o usuário está logado, fazendo com que eu não
        saia da página inicial */
        $username = 'postgres';
        $password = 'postgres';
        $host = "database";
        $database = "andifes";
        $port = 5432;

        $connString = "host={$host} port={$port} dbname={$database} user={$username} password={$password}";
        $conn = @pg_connect($connString);
        
        $table = 'editais_abertos';
        $query = "SELECT * FROM $table";
        $result = @pg_query($conn, $query);

        if (!$result) {
            throw new Exception(pg_last_error($conn));
        }

        $campos = @pg_fetch_all($result);

        $template = $twig->load('login.html');
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
