<?php
session_start();
include("server.php");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['add_user'])) {
    // รับค่าจากฟอร์ม
    $empName = mysqli_real_escape_string($conn, $_POST['emp_name']);
    $password = mysqli_real_escape_string($conn, $_POST['emp_password']);
    $roleId = intval($_POST['role_id']);
    $depCode = mysqli_real_escape_string($conn, $_POST['dep_code']);

    // ดึง emp_id ล่าสุดจากฐานข้อมูล
    $result = $conn->query("SELECT MAX(emp_id) AS max_id FROM employee");
    $row = $result->fetch_assoc();
    $newEmpId = $row['max_id'] ? $row['max_id'] + 1 : 1; // ถ้าไม่มีข้อมูลให้เริ่มที่ 1

    // เพิ่มข้อมูลพนักงานใหม่
    $sql = "INSERT INTO employee (emp_id, emp_name, emp_password, role_id, dep_code) 
            VALUES ($newEmpId, '$empName', '$password', $roleId, '$depCode')";

    if ($conn->query($sql)) {
        echo "<script>alert('User added successfully with ID: $newEmpId'); window.location='admin.php';</script>";
    } else {
        echo "<script>alert('Error adding user: " . $conn->error . "');</script>";
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2 class="form-title">Add User</h2>
        <form action="add_user.php" method="POST">
            <label for="emp_name">Name:</label>
            <input type="text" name="emp_name" id="emp_name" placeholder="Enter name" required>

            <label for="emp_password">Password:</label>
            <input type="password" name="emp_password" id="emp_password" placeholder="Enter password" required>

            <label for="role_id">Role ID:</label>
            <input type="number" name="role_id" id="role_id" placeholder="Enter role ID" required>

            <label for="dep_code">Department Code:</label>
            <input type="text" name="dep_code" id="dep_code" placeholder="Enter department code" required>

            <button type="submit" name="add_user">Add User</button>
            <a href="admin.php"><button type="button">Cancel</button></a>
        </form>
    </div>
</body>
</html>
