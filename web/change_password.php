<?php
session_start();
include("server.php");

// ตรวจสอบว่าผู้ใช้ล็อกอินอยู่หรือไม่
if (!isset($_SESSION["emp_id"])) {
    header("Location: login.php");
    exit();
}

// ตรวจสอบการส่งข้อมูลฟอร์ม
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $currentPassword = mysqli_real_escape_string($conn, $_POST["current_password"]);
    $newPassword = mysqli_real_escape_string($conn, $_POST["new_password"]);
    $empId = $_SESSION["emp_id"];

    // ตรวจสอบรหัสผ่านเดิม
    $query = "SELECT emp_password FROM employee WHERE emp_id = $empId";
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($result);

    if ($row && $row["emp_password"] === $currentPassword) {
        // อัปเดตรหัสผ่านใหม่
        $updateQuery = "UPDATE employee SET emp_password = '$newPassword' WHERE emp_id = $empId";
        if (mysqli_query($conn, $updateQuery)) {
            echo "Password updated successfully!";
            header("Location: index.php");
            exit();
        } else {
            echo "Error updating password: " . mysqli_error($conn);
        }
    } else {
        echo "Current password is incorrect.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <link rel="stylesheet" href="change_password.css">
</head>
<body>
    <h1>Change Password</h1>
    <form action="change_password.php" method="POST">
        <label for="current_password">Current Password:</label>
        <input type="password" id="current_password" name="current_password" required>
        
        <label for="new_password">New Password:</label>
        <input type="password" id="new_password" name="new_password" required>
        
        <button class="save-btn" type="submit">Save Change</button>

    </form>
    <a href="index.php">Cancel</a>
</body>
</html>
