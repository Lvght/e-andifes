<?php

// Envia a página de template
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    include $_ENV['HOME'] . '/helpers/twig.php';
    $template = $twig->load('login.html');  
    echo $template->render();
    // echo "saidps";
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

    // Verifica se a conexão foi bem sucedida
    if (!$conn) {
        header('Location: /login.php?erro=401_unauthorized');
    }
    else {
        session_start();
        // Se a conexão foi bem sucedida, obtém os dados do usuário.
        $query = pg_query($conn, "SELECT * FROM fn_who_am_i()");
        $result = pg_fetch_assoc($query);
        $_SESSION['name'] = $result['nome'];

        $query = pg_query($conn, "SELECT * FROM fn_get_my_roles()");
        $result = pg_fetch_all($query);
        $_SESSION['roles'] = $result;

        $_SESSION['username'] = $_POST['username'];
        $_SESSION['password'] = $_POST['password'];
        header('Location: /dashboard.php');
    }
}
