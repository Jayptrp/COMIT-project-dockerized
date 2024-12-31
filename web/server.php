<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Update connection settings to match docker-compose configuration
$conn = mysqli_connect("db", "root", "rootpassword", "mysql-db");

// Check database connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
