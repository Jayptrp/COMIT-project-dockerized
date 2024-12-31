<?php 
session_start();
include("server.php");

if (isset($_POST["username"]) && isset($_POST["password"])) {
    $name = $_POST["username"];
    $password = $_POST["password"];
    
    // Assuming $conn is your database connection
    // Use prepared statement to prevent SQL injection
    $sql = "SELECT emp_name, emp_password, role_id , emp_id, dep_code, emp_pfp FROM employee WHERE emp_name = ?";
    $stmt = mysqli_prepare($conn, $sql);
    
    // Bind the parameter to the prepared statement
    mysqli_stmt_bind_param($stmt, "s", $name); // "s" means string
    
    // Execute the statement
    mysqli_stmt_execute($stmt);
    
    // Get the result of the query
    $result = mysqli_stmt_get_result($stmt);
    
    // Check if the username exists
    if (mysqli_num_rows($result) > 0) {
        // Fetch the result
        $row = mysqli_fetch_assoc($result);
        
        // Check if the password matches
        if ($password == $row["emp_password"]) {
            // Password is correct, store session data
            $_SESSION["name"] = $row["emp_name"];
            $_SESSION["role"] = $row["role_id"];
            $_SESSION["emp_id"] = $row["emp_id"];
            $_SESSION["dep_code"] = $row["dep_code"];
            $_SESSION["emp_pfp"] = $row["emp_pfp"];
            // Redirect to index.php
            header("Location: index.php");
            exit(); // Ensure no further code is executed after the redirect
        } else {
            // Password is incorrect
            echo "Incorrect password.";
        }
    } else {
        // Username does not exist
        echo "Username does not exist.";
    }
    
    // Close the prepared statement
    mysqli_stmt_close($stmt);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="box">
        <p>Login</p>
        <form action="login.php" method="POST">
            <input name="username" type="text" placeholder="Username" required>
            <input name="password" type="password" placeholder="Password" required>
            <button type="submit">Enter</button>
        </form>
    </div>
</body>
</html>




