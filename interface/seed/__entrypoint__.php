<?php
include "seed/Seeder.php";

$dbReady = false;
while (!getConnection("postgres", "postgres")) {
    echo ".";
    sleep(1);
}

$seeder = new Seeder();
$f = include "__create__.php";

foreach ($f as $table) {
    $data = include "$table.php";
    $seeder->insert($table, $data);
    echo "✅ $table\n";
}

shell_exec("php -S 0.0.0.0:8000 -t public/");
