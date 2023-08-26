<?php

include $_ENV['HOME'] . "/helpers/get_connection.php";

class Seeder {
    private $connection;

    public function __construct() {
        $this->connection = getConnection("postgres", "postgres");
    }

    public function insert($tableName, $data): bool {
        $sql = "INSERT INTO $tableName (";
        $keys = array_keys($data[0]);
    
        foreach ($keys as $key) {
            $sql .= "$key, ";
        }
    
        $sql = substr($sql, 0, -2);
        $sql .= ") VALUES ";
    
        foreach ($data as $row) {
            $sql .= "(";

            foreach ($keys as $key) {
                $value = $row[$key] ?? null;
                if ($value === null)
                    $sql .= "NULL, ";
                elseif ($value === true)
                    $sql .= "TRUE, ";
                elseif ($value === false)
                    $sql .= "FALSE, ";
                else
                    $sql .= "'$value', ";
            }
            
            $sql = substr($sql, 0, -2);
            $sql .= "), ";
        }
    
        $sql = substr($sql, 0, -2); 
        $result = pg_query($this->connection, $sql);
        return $result !== false;
    }
}