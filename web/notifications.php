<?php
session_start();
include("server.php");

if (!isset($_SESSION["emp_id"])) {
    header("Location: login.php");
    exit();
}

$empId = $_SESSION["emp_id"];
$depCode = $_SESSION["dep_code"];

// ดึง Notifications ที่เกี่ยวข้องกับผู้ใช้งาน
$sql = "SELECT * FROM notifications 
        WHERE emp_id = '$empId' OR (emp_id IS NULL AND com_id IN (
        SELECT com_id FROM complaint WHERE dep_code = '$depCode'
        ))
        ORDER BY notification_time DESC";

$result = mysqli_query($conn, $sql);
?>

<<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #e3f2fd, #f1f8e9);
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
        }
        h1 {
            text-align: center;
            color: #1e88e5;
        }
        .notifications-list {
            list-style: none;
            padding: 0;
        }
        .notification {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        .notification.unread {
            background-color: #e3f2fd;
            border-left: 5px solid #1e88e5;
        }
        .notification.read {
            background-color: #f9f9f9;
        }
        .notification:hover {
            background-color: #e0f7fa;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .notification p {
            margin: 0;
            font-size: 16px;
        }
        .notification small {
            font-size: 12px;
            color: #666;
        }
        form {
            margin: 0;
        }
        button {
            padding: 8px 12px;
            border: none;
            border-radius: 6px;
            background-color: #1e88e5;
            color: white;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #1565c0;
        }
        .no-notifications {
            text-align: center;
            font-size: 18px;
            color: #666;
        }
        .back-button {
            display: block;
            margin: 20px auto 0;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            background-color: #ff6f61;
            color: white;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .back-button:hover {
            background-color: #d84315;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Notifications</h1>
        <?php if (mysqli_num_rows($result) > 0): ?>
            <ul class="notifications-list">
                <?php while ($row = mysqli_fetch_assoc($result)): ?>
                    <li class="notification <?php echo $row['is_read'] ? 'read' : 'unread'; ?>">
                        <div>
                            <p><?php echo htmlspecialchars($row['message']); ?></p>
                            <small><?php echo date("d M Y, H:i", strtotime($row['notification_time'])); ?></small>
                        </div>
                        <?php if (!$row['is_read']): ?>
                            <form action="update_notification.php" method="POST">
                                <input type="hidden" name="notification_id" value="<?php echo $row['notification_id']; ?>">
                                <button type="submit">Mark as Read</button>
                            </form>
                        <?php endif; ?>
                    </li>
                <?php endwhile; ?>
            </ul>
        <?php else: ?>
            <p class="no-notifications">No notifications available.</p>
        <?php endif; ?>
        <a href="index.php" class="back-button">Back to Home</a>
    </div>
</body>
</html>
