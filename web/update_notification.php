<?php
include("server.php");

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['notification_id'])) {
    $notificationId = intval($_POST['notification_id']);

    $sql = "UPDATE notifications SET is_read = 1 WHERE notification_id = $notificationId";
    if (mysqli_query($conn, $sql)) {
        header("Location: notifications.php");
        exit();
    } else {
        echo "Error updating notification: " . mysqli_error($conn);
    }
}
?>
