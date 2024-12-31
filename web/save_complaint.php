
<?php
// Database connection settings

session_start();
include("server.php");

// Create connection

// Retrieve form data
$complaint_name = $_POST['Cname'];
$complaint_detail = $_POST['Cdetail'];
$priority = $_POST['priority'];

// Insert data into the complaints table (replace `complaints` with your table name)
$sql = "INSERT INTO complaint (com_name, com_detail, com_level) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $complaint_name, $complaint_detail, $priority);

if ($stmt->execute()) {
    echo "Complaint added successfully!";
    header("Location: index.php"); // Redirect to the main page after success
    exit();
} else {
    echo "Error: " . $stmt->error;
}

// Close the connection
$stmt->close();
$conn->close();
?>
