<?php
include 'server.php';

$totalComplaintsQuery = "SELECT COUNT(*) AS total FROM complaint";
$totalComplaintsResult = mysqli_query($conn, $totalComplaintsQuery);

if (!$totalComplaintsResult) {
    die("Query Failed: " . mysqli_error($conn));
}
$totalComplaints = mysqli_fetch_assoc($totalComplaintsResult)['total'];

$departmentComplaintsQuery = "
    SELECT d.dep_name, COUNT(*) AS count 
    FROM complaint c
    JOIN department d ON c.dep_code = d.dep_code
    GROUP BY d.dep_name
";
$departmentComplaintsResult = mysqli_query($conn, $departmentComplaintsQuery);

if (!$departmentComplaintsResult) {
    die("Query Failed: " . mysqli_error($conn));
}
$departments = [];
while ($row = mysqli_fetch_assoc($departmentComplaintsResult)) {
    $departments[] = $row;
}

$statusQuery = "SELECT com_status, COUNT(*) AS count FROM complaint GROUP BY com_status";
$statusResult = mysqli_query($conn, $statusQuery);

if (!$statusResult) {
    die("Query Failed: " . mysqli_error($conn));
}
$statuses = [];
while ($row = mysqli_fetch_assoc($statusResult)) {
    $statuses[] = $row;
}

$roleComplaintsQuery = "
    SELECT r.role, COUNT(*) AS count 
    FROM complaint c
    JOIN employee e ON c.emp_id = e.emp_id
    JOIN roles r ON e.role_id = r.role_id
    GROUP BY r.role
";
$roleComplaintsResult = mysqli_query($conn, $roleComplaintsQuery);

if (!$roleComplaintsResult) {
    die("Query Failed: " . mysqli_error($conn));
}
$roles = [];
while ($row = mysqli_fetch_assoc($roleComplaintsResult)) {
    $roles[] = $row;
}

// $topWritersQuery = "SELECT writer, COUNT(*) AS count FROM board GROUP BY writer ORDER BY count DESC LIMIT 5";
// $topWritersResult = mysqli_query($conn, $topWritersQuery);

// if (!$topWritersResult) {
//     die("Query Failed: " . mysqli_error($conn));
// }
// $writers = [];
// while ($row = mysqli_fetch_assoc($topWritersResult)) {
//     $writers[] = $row;
// }



// Graph Zone //

// Query to fetch data
$sql = "SELECT com_type, COUNT(*) as count FROM complaint GROUP BY com_type";
$result = $conn->query($sql);

// Prepare data for Chart.js
$categories = [];
$counts = [];

while ($row = $result->fetch_assoc()) {
    $categories[] = $row['com_type'];
    $counts[] = $row['count'];
}

// Pass data to JavaScript
echo "<script>
        const categories = " . json_encode($categories) . ";
        const counts = " . json_encode($counts) . ";
      </script>";
?>