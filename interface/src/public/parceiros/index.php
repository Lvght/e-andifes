<?php

include $_ENV['HOME'] . '/inc/inject.php';

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// Comunicação com o banco de dados
try {
    $query = "SELECT * FROM view_parceiros";
    $resultado = executaQueryNoBancoDeDados($query);

    $template = $twig->load('parceiros/index.html');

    // Você deve declarar um array com as propriedades que deseja usar dentro do
    // arquivo HTML.

    // Obtenho todas as chaves do array para desenhar a tabela.
    if ($resultado) {
        $keys = array_keys($resultado[0]);
    } else {
        $keys = [];
    }

    $props = [
        'parceiros' => $resultado,
        'keys' => $keys
    ];
    echo $template->render($props);
}

// Você pode decidir o que fazer em caso de erro.
// Adicionar uma nova variável e exibir um erro bonito na interface? Pode ser
// Neste exemplo, eu só mando o usuário para uma página de erro e boa.
catch (Throwable $e) {
    $error = $e->getMessage();
    
    $template = $twig->load('500.html');
    echo $template->render(['error' => $error]);
}
