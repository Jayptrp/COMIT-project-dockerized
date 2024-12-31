<?php
include("server.php");

// ดึงข้อมูลประเภทปัญหาจากฐานข้อมูล
$query = "SELECT name, priority FROM category ORDER BY priority ASC";
$result = $conn->query($query);

$categories = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $categories[] = $row;
    }
}

// ส่งข้อมูลประเภทปัญหากลับในรูปแบบ JSON
header('Content-Type: application/json');
echo json_encode($categories);
$conn->close();
?>
