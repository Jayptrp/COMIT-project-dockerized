<?php
include("server.php");
session_start();

if (!isset($_SESSION["emp_id"])) {
    header("Location: login.php");
    exit();
}

$empId = $_SESSION["emp_id"];

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['com_id'])) {
    $comId = $_POST['com_id'];
    $comName = $_POST['com_name'];
    $comDetail = $_POST['com_detail'];
    $comStatus = $_POST['com_status'];
    $isTechnician = $_POST['isTech'];

    // Check if the logged-in user is the owner of the complaint
    $result = $conn->query("SELECT emp_id FROM complaint WHERE com_id = $comId");
    $owner = $result->fetch_assoc();
    
    if ($owner['emp_id'] == $empId || $isTechnician) {
        // Update complaint details
        $updateQuery = "UPDATE complaint SET com_name = '$comName', com_detail = '$comDetail', com_status = '$comStatus' WHERE com_id = $comId";
        if ($conn->query($updateQuery) === TRUE) {
            header("Location: index.php");
        } else {
            echo "Error updating complaint: " . $conn->error;
        }
    } else {
        echo "You do not have permission to edit this complaint.";
    }
}

// Handle complaint deletion
if (isset($_GET['delete']) && isset($_GET['com_id'])) {
    $comId = $_GET['com_id'];

    // Check if the logged-in user is the owner of the complaint
    $result = $conn->query("SELECT emp_id FROM complaint WHERE com_id = $comId");
    $owner = $result->fetch_assoc();

    if ($owner['emp_id'] == $empId || $empId == '999') {
        // Delete the complaint
        $deleteQuery = "DELETE FROM complaint WHERE com_id = $comId";
        if ($conn->query($deleteQuery) === TRUE) {
            header("Location: index.php");
        } else {
            echo "Error deleting complaint: " . $conn->error;
        }
    } else {
        echo "You do not have permission to delete this complaint.";
    }
}
?>

