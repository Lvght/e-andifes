<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: ../index.php");
}

include "helpers/connection.php";
$connection = getConnection($_SESSION['username'], $_SESSION['password']);
