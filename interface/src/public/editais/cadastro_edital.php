<?php

include $_ENV['HOME'] . '/inc/inject.php';


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Verifica se o arquivo foi enviado
    if(isset($_FILES['arquivo'])) {
        // Faz o encoding correto do arquivo.
        $file_temp = $_FILES['arquivo']['tmp_name'];
        $file_content = file_get_contents($file_temp);
        $escaped_content = pg_escape_bytea(getConnection(), $file_content);

        // Preparação e execução da query SQL
        $query = "CALL pr_cadastra_edital($1, $2, $3, $4, $5)";
        $result = pg_prepare(getConnection(), "my_query", $query);
        $result = pg_execute(getConnection(), "my_query", array(
            $_POST['nome'],
            $escaped_content,
            $_POST['data-publicacao'],
            $_POST['ano'],
            $_POST['semestre']));

        // Redireciona a pessoa para a tela de editais.
        header('Location: /editais/?msg=cadastro_ok');
        exit();
    }
}

else {

    $template = $twig->load('editais_cadastro.html');
    echo $template->render();
}