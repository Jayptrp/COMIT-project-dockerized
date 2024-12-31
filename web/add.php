<?php
session_start();
include("server.php");

if (!isset($_SESSION["name"])) {
    header("Location: login.php");
    exit();
}
if (isset($_GET["logout"])) {
    session_destroy();
    header("Location: login.php");
    exit();
}

// เปิดการแสดงข้อผิดพลาด
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (isset($_POST['submit'])) {
    // ตรวจสอบว่า session มีค่า emp_id เป็นตัวเลข
    if (!isset($_SESSION['emp_id']) || !is_numeric($_SESSION['emp_id'])) {
        echo "Error: Invalid emp_id in session.";
        exit();
    }

    // รับข้อมูลจากฟอร์มและป้องกัน SQL Injection
    $Cname = mysqli_real_escape_string($conn, $_POST['Cname']);
    $Cdetail = mysqli_real_escape_string($conn, $_POST['Cdetail']);
    $Cpriority = mysqli_real_escape_string($conn, $_POST['priority']);
    $Ctype = mysqli_real_escape_string($conn, $_POST['type']);
    $Cstatus = 'Waiting';
    $emp_id = intval($_SESSION['emp_id']);
    $Ctime = date('Y-m-d H:i:s');

    if (isset($_SESSION['dep_code'])) {
        $dep_code = $_SESSION['dep_code'];
    } else {
        echo "Error: Department code is not set in session.";
        exit();
    }

    // สร้างคำสั่ง SQL สำหรับเพิ่มข้อมูลลงในตาราง complaint
    $sql = "INSERT INTO complaint (com_name, com_detail, com_level, com_status, emp_id, dep_code, com_time, com_type)
            VALUES ('$Cname', '$Cdetail', '$Cpriority', '$Cstatus', '$emp_id', '$dep_code', '$Ctime', '$Ctype')";

    
    // รันคำสั่ง SQL และตรวจสอบผลลัพธ์
    if (mysqli_query($conn, $sql)) {
        echo "Record added successfully!";
    
        // ดึง ID ของ Complaint ที่เพิ่งเพิ่มใหม่
        $complaintId = mysqli_insert_id($conn);
    
        // เพิ่ม Notification สำหรับพนักงานที่มี role_id > 1
        $notificationMessage = mysqli_real_escape_string($conn, "New complaint '$Cname' added with priority $Cpriority.");
        $employeeQuery = "SELECT emp_id FROM employee WHERE role_id > 1"; // เปลี่ยนเป็น role_id > 1
        $employeeResult = mysqli_query($conn, $employeeQuery);
    
        if ($employeeResult && mysqli_num_rows($employeeResult) > 0) {
            while ($employee = mysqli_fetch_assoc($employeeResult)) {
                $targetEmpId = $employee['emp_id'];
                $notificationSQL = "INSERT INTO notifications (message, emp_id, com_id, notification_time, is_read) 
                                    VALUES ('$notificationMessage', '$targetEmpId', '$complaintId', NOW(), 0)";
                if (!mysqli_query($conn, $notificationSQL)) {
                    echo "Error adding notification: " . mysqli_error($conn);
                }
            }
            echo "Notifications sent to employees with role_id > 1.";
        } else {
            if (!$employeeResult) {
                echo "SQL Error in employee query: " . mysqli_error($conn);
            } else {
                echo "No employees found with role_id > 1.";
            }
        }
    
        // Redirect to index.php after 2 seconds
        header("Refresh: 2; URL=index.php");
        exit();
    } else {
        echo "Error: " . mysqli_error($conn);
        exit();
    }
    
    
}
// Assuming user session contains their ID
$userId = $_SESSION['emp_id'];
$result = $conn->query("SELECT emp_pfp FROM employee WHERE emp_id = $userId");
$userProfilePicUrl = $result->fetch_assoc()['emp_pfp'] ?? 'uploads/profile_pictures/default.avif'; // Use default image if none exists

// Fetch categories
$query = "SELECT name, priority FROM category";
$result = $conn->query($query);
$categories = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $categories[] = $row;
    }
}
$conn->close();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Complaint</title>
    <script src="https://kit.fontawesome.com/4b768977d9.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="add.css">
    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="header">
        <div class="space"></div>
        <h3>
            <span style="color: #0da6c2;">N</span>
            <span style="color: #f89e0e;">G</span>
            <span style="color: #ed6dbb;">A</span>
            <span style="color: #ffde59;">E</span>
            <span style="color: #38b6ff;">N</span>
            <span style="color: #c453d1;">G</span>
        </h3>
        <div class="info-btn">i</div>
        <div class="bell-btn">
    <a href="notifications.php">
        <i class="fa-solid fa-bell"></i>
    </a>
</div>
        <div class="profile-icon">
            <img src="<?php echo htmlspecialchars($userProfilePicUrl); ?>" alt="User Profile" id="pfp"> <!-- Replace with the actual image path from the database -->
        </div>
        <div class="profile-popup" id="pfp-popup"> <!-- PFP UPDATE BOI !!! -->
            <form action="upload.php" method="POST" enctype="multipart/form-data">
                <label for="profilePic">Choose your profile picture:</label>
                <input type="file" name="profilePic" id="profilePic" accept="image/*" required>
                <button type="submit">Upload</button>
            </form>
        </div>
        <div class="item2"><a href="index.php?logout=1"><button class="logout-btn"><i id="logout-btn" class="fa-solid fa-right-from-bracket"></i></button></a></div>
    </div>

    <div class="flex-box">
        <div class="box">
            <a href="index.php"><button class="exit"><span>Back</span></button></a>
            <p><b>Add Complaint</b></p>
            <form action="add.php" method="POST">
                <div class="inner-box">
                    <input name="Cname" class="name" type="text" placeholder="Your Complaint" required>
                    <span class="type">Type:
                    <select id="type" name="type">
                        <?php foreach ($categories as $category): ?>
                            <option value="<?php echo $category['name']; ?>" data-priority="<?php echo $category['priority']; ?>">
                                <?php echo $category['name']; ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                    </span>
                    <textarea name="Cdetail" class="detail" placeholder="Detail.. (optional)"></textarea>
                </div>
                <div class="btnCenter">
                    <b>Priority:</b>
                    <input type="text" id="priority" name="priority" readonly>
                    <div>
                        <button type="submit" name="submit">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
        const pfp = document.getElementById("pfp");
        pfp.addEventListener("click",togglePopup2);
        function togglePopup2() {
            const popup = document.getElementById('pfp-popup');
            popup.classList.toggle('show');
        }

        document.addEventListener('DOMContentLoaded', () => {
            const typeDropdown = document.getElementById('type');
            const priorityDropdown = document.getElementById('priority');

            // Set initial priority based on selected type
            function updatePriority() {
                const selectedOption = typeDropdown.options[typeDropdown.selectedIndex];
                priorityDropdown.value = selectedOption.dataset.priority;
            }

            // Disable manual changes to the priority dropdown
            priorityDropdown.addEventListener('mousedown', (e) => {
                e.preventDefault();
            });

            // Update priority on type change
            typeDropdown.addEventListener('change', updatePriority);

            // Initialize priority on page load
            updatePriority();
        });
    </script>
</body>
</html>

