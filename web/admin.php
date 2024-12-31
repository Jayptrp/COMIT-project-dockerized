<?php
session_start();
include("server.php");

if (!isset($_SESSION["name"]) || $_SESSION["name"] !== "Admin") {
  header("Location: index.php");
  exit();
}
if (isset($_GET["logout"])) {
  session_destroy();
  header("Location: login.php");
  exit();
}



if (isset($_GET['delete']) && isset($_GET['emp_id'])) {
  $empIdToDelete = intval($_GET['emp_id']);
  $deleteSql = "DELETE FROM employee WHERE emp_id = $empIdToDelete";
  if ($conn->query($deleteSql)) {
      echo "<script>alert('User deleted successfully!'); window.location='admin.php';</script>";
  } else {
      echo "<script>alert('Error deleting user: " . $conn->error . "');</script>";
  }
}

if (isset($_POST['update'])) {
  $empId = intval($_POST['emp_id']);
  $empName = mysqli_real_escape_string($conn, $_POST['emp_name']);
  $role = mysqli_real_escape_string($conn, $_POST['role']);

  $updateSql = "UPDATE employee 
                SET emp_name = '$empName', role_id = 
                    (SELECT role_id FROM roles WHERE role = '$role') 
                WHERE emp_id = $empId";

  if ($conn->query($updateSql)) {
      echo "<script>alert('User updated successfully!'); window.location='admin.php';</script>";
  } else {
      echo "<script>alert('Error updating user: " . $conn->error . "');</script>";
  }
}


?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Panel</title>
  <link rel="stylesheet" href="admin.css">
  
</head>
<body>
  <div class="container">
    <!-- Sidebar Navigation -->
    <aside class="sidebar">
      <h2>Admin Panel</h2>
      <nav>
        <ul>
          
          <li><a href="add_user.php">ADD USERS</a></li>
          <li><a href="add_category.php">ADD CATEGORIES</a></li>
          <li><a href="report.php">REPORTS</a></li>
          <li><a href="index.php">INDEX</a></li>
          <li><a href="add.php">ADD COMPLAINTS</a></li>
          <li><a href="login.php">LOGOUT</a></li>
        </ul>
      </nav>
    </aside>
    
    <!-- Main Content Area -->
    <main class="main-content">
      <!-- Users Section -->
      <section id="users">
        <h2>Users</h2>
        <p>Manage users here.</p>
        
        <!-- User Table -->
        <table class="user-table">
          <thead>
            <tr>
              <th style="width:30%;">Name</th>
              <th style="width:20%;">ID</th>
              <th style="width:20%;">Role</th>
              <th style="width:20%;">Department</th>
              <th style="width:10%;">Edit</th>
            </tr>
          </thead>
          <tbody>
    <?php
    $sql = "SELECT emp_id, emp_name, role_id, dep_code FROM employee";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo '<tr>';
            echo '<td>' . htmlspecialchars($row["emp_name"]) . '</td>';
            echo '<td>' . htmlspecialchars($row["emp_id"]) . '</td>';
            echo '<td>' . htmlspecialchars($row["role_id"]) . '</td>';
            echo '<td>' . htmlspecialchars($row["dep_code"]) . '</td>';

            // เพิ่มปุ่ม Edit และ Delete
            echo '<td>
                    <a class="edit-a" href="edit_employee.php?emp_id=' . $row["emp_id"] . '">
                        <button class="edit-btn"><i class="fa-solid fa-pen-to-square"></i></button>
                    </a>
                    <a class="delete-a" href="admin.php?delete=true&emp_id=' . $row["emp_id"] . '" onclick="return confirm(\'Are you sure you want to delete this employee?\')">
                        <button class="delete-btn"><i class="fa-solid fa-trash-can"></i></button>
                    </a>
                  </td>';
            echo '</tr>';
        }
    } else {
        echo '<tr><td colspan="5">No employees found</td></tr>';
    }
    ?>
</tbody>


        </table>
      </section>
      
  <div class="popup">
    <div id="editUserPopup" class="edit-popup">
      <div class="popup-content">
        <form id="editUserForm" action="admin.php" method="POST">
          <h3>Edit User</h3>
          <input type="hidden" id="editEmpId" name="emp_id" value="">

          <label for="editEmpName">Name:</label>
          <input type="text" id="editEmpName" name="emp_name" required>

          <label for="editRole">Role:</label>
          <input type="text" id="editRole" name="role" required>

          <button type="submit" name="update">Update</button>
          <button type="button" onclick="closeEditPopup()">Cancel</button>
        </form>
      </div>
    </div>
  </div>

  <script src="https://kit.fontawesome.com/4b768977d9.js" crossorigin="anonymous"></script>
</body>
</html>

