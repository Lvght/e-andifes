<?php include "helpers/inject.php"; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Olá, <?php echo $_SESSION['username']; ?></h1>

    <?php
        // Define qual a query a ser executada.
        $sql = "SELECT * FROM endereco";

        // Roda a query no banco.
        // $connection é definida no [helpers/inject.php]
        $rawResult = pg_query($connection, $sql);
        $results = pg_fetch_all($rawResult);

        // Renderiza os resultados.
        foreach ($results as $result) {
            echo "<p>" . json_encode($result, JSON_UNESCAPED_UNICODE) . "</p>";
        }
    ?>
</body>
</html>