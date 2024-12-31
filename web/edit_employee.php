<?php
session_start();
include("server.php");



// ตรวจสอบว่ามีการส่งฟอร์มแก้ไขข้อมูล
if (isset($_POST['update']) && $_SERVER["REQUEST_METHOD"] == "POST") {
    $empId = intval($_POST['emp_id']);
    $empName = mysqli_real_escape_string($conn, $_POST['emp_name']);
    $roleId = intval($_POST['role_id']);
    $depCode = mysqli_real_escape_string($conn, $_POST['dep_code']);

    // SQL อัปเดตข้อมูลในฐานข้อมูล
    $updateSql = "UPDATE employee 
    SET emp_name = '$empName', role_id = $roleId, dep_code = '$depCode' 
    WHERE emp_id = $empId";

    if ($conn->query($updateSql)) {
        echo "<script>alert('Employee updated successfully!'); window.location='admin.php';</script>";
    } else {
        echo "<script>alert('Error updating employee: " . $conn->error . "');</script>";
    }
    exit();
}



// ตรวจสอบว่ามี emp_id ส่งมาหรือไม่
if (!isset($_GET['emp_id'])) {
    echo "<script>alert('No employee selected!'); window.location='admin.php';</script>";
    exit();
}
$empId = intval($_GET['emp_id']);
// ดึงข้อมูลพนักงานจากฐานข้อมูล
$sql = "SELECT * FROM employee WHERE emp_id = $empId";
$result = $conn->query($sql);

if ($result->num_rows == 0) {
    echo "<script>alert('Employee not found!'); window.location='admin.php';</script>";
    exit();
}
$employee = $result->fetch_assoc();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="form-container">
        <h2 class="form-title">Edit Employee</h2>
        <form action="edit_employee.php" method="POST">
            <!-- Hidden Field สำหรับ emp_id -->
            <input type="hidden" name="emp_id" value="<?php echo htmlspecialchars($employee['emp_id']); ?>">

            <label for="emp_name">Name:</label>
            <input type="text" name="emp_name" id="emp_name" value="<?php echo htmlspecialchars($employee['emp_name']); ?>" required>

            <label for="role_id">Role ID:</label>
            <input type="number" name="role_id" id="role_id" value="<?php echo htmlspecialchars($employee['role_id']); ?>" required>

            <label for="dep_code">Department Code:</label>
            <input type="text" name="dep_code" id="dep_code" value="<?php echo htmlspecialchars($employee['dep_code']); ?>" required>

            <button type="submit" name="update">Update</button>
            <a href="admin.php"><button type="button">Cancel</button></a>
        </form>
    </div>
</body>
</html>

