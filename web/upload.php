<?php
session_start();
include("server.php");

$userId = $_SESSION['emp_id']; // Assuming user is logged in and session contains their ID

if (isset($_FILES['profilePic']) && $_FILES['profilePic']['error'] === UPLOAD_ERR_OK) {
    // Validate the file type
    $allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
    $fileType = $_FILES['profilePic']['type'];
    if (!in_array($fileType, $allowedTypes)) {
        echo "Invalid file type.";
        exit;
        header("Refresh: 2; URL=index.php");
    }

    // Generate unique file name
    $fileName = $userId . '_profile_picture';

    // Define upload directory
    $uploadDir = 'uploads/profile_pictures/';
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $filePath = $uploadDir . $fileName;

    // Move uploaded file to the target directory
    if (move_uploaded_file($_FILES['profilePic']['tmp_name'], $filePath)) {
        $url = $filePath;
        $stmt = $conn->prepare("UPDATE employee SET emp_pfp = ? WHERE emp_id = ?");
        $stmt->bind_param('si', $url, $userId);
        $stmt->execute();
        $stmt->close();

        echo "Profile picture updated successfully!";
        header("Refresh: 1; URL=index.php");
    } else {
        echo "Failed to upload file.";
        header("Refresh: 2; URL=index.php");
    }
} else {
    echo "No file uploaded or an error occurred.";
    header("Refresh: 2; URL=index.php");
}
?>
