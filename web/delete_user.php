<?php
include("server.php");
if (isset($_GET['emp_id'])) {
    $empId = intval($_GET['emp_id']);
    $sql = "DELETE FROM employee WHERE emp_id = $empId";
    if ($conn->query($sql)) {
        header("Location: admin.php?message=User Deleted");
    } else {
        echo "Error: " . $conn->error;
    }
}
?>
