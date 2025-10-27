<?php
    function db() {
        try {
            $dsn = "mysql:host=localhost;dbname=exam2;charset=utf8mb4";
            $user = "root";
            $pass = "";
            
            return new PDO($dsn, $user, $pass, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
            ]);
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
            exit();
        }
    }