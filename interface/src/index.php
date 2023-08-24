<?php session_start(); ?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Andifes</h1>
    <!-- 
        Formulário de login.

        Envia os dados do usuário para que o servidor tente criar uma
        conexão com o banco de dados.
    -->
    <form method="POST" action="login.php">
        <?php
            if (isset($_SESSION['login_error'])) {
                echo "<p>" . $_SESSION['login_error'] . "</p>";
                unset($_SESSION['login_error']);
            }
        ?>

        <input type="text"
               name="username"
               placeholder="Username"
               required>

        <input type="password"
               name="password"
               placeholder="Password"
               required>

        <input type="submit" value="Login">
    </form>
</body>
</html>