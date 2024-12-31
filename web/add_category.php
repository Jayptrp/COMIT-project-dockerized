<?php
session_start();
include("server.php");

// Redirect non-admin users
if (!isset($_SESSION["name"]) || $_SESSION["name"] !== "Admin") {
    header("Location: login.php");
    exit();
}

// Reset success and error messages before each action
$successMessage = '';
$errorMessage = '';

// Add Category
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["add_category"])) {
    $categoryName = mysqli_real_escape_string($conn, $_POST["category_name"]);
    $priority = mysqli_real_escape_string($conn, $_POST["priority"]);

    $sql = "INSERT INTO category (name, priority) VALUES ('$categoryName', '$priority')";
    
    if ($conn->query($sql)) {
        $successMessage = "Category added successfully!";
    } else {
        $errorMessage = "Error: " . $conn->error;
    }
}

// Edit Category
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["edit_category"])) {
    $categoryId = intval($_POST["category_id"]);
    $categoryName = mysqli_real_escape_string($conn, $_POST["category_name"]);
    $priority = mysqli_real_escape_string($conn, $_POST["priority"]);

    $sql = "UPDATE category SET name = '$categoryName', priority = '$priority' WHERE id = $categoryId";

    if ($conn->query($sql)) {
        $successMessage = "Category updated successfully!";
    } else {
        $errorMessage = "Error: " . $conn->error;
    }
}

// Delete Category
if (isset($_GET["delete"])) {
    $categoryId = intval($_GET["delete"]);
    $sql = "DELETE FROM category WHERE id = $categoryId";

    if ($conn->query($sql)) {
        $successMessage = "Category deleted successfully!";
    } else {
        $errorMessage = "Error: " . $conn->error;
    }
}

// Fetch all categories
$categories = $conn->query("SELECT * FROM category ORDER BY created_at DESC");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
    <link rel="stylesheet" href="add_category.css">
</head>
<body>
    <div class="container">
        <button class="exit" onclick="window.location.href='admin.php'">
            <span>Exit</span>
        </button>
        <h1>Manage Categories</h1>

        <!-- Corrected Success/Error Messages Section -->
        <?php if (!empty($successMessage)): ?>
            <p class="success-message"><?php echo $successMessage; ?></p>
        <?php endif; ?>

        <?php if (!empty($errorMessage)): ?>
            <p class="error-message"><?php echo $errorMessage; ?></p>
        <?php endif; ?>

        <!-- Add Category Form -->
        <form method="POST" action="">
            <h2>Add Category</h2>
            <label for="category_name">Category Name:</label>
            <input type="text" id="category_name" name="category_name" required>

            <label for="priority">Priority:</label>
            <select id="priority" name="priority" required>
                <option value="Emergency">Emergency</option>
                <option value="Urgent">Urgent</option>
                <option value="Normal">Normal</option>
            </select>

            <button type="submit" name="add_category">Add Category</button>
        </form>

        <!-- Existing Categories -->
        <h2>Existing Categories</h2>
        <table>
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Priority</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($categories->num_rows > 0): ?>
                    <?php while ($row = $categories->fetch_assoc()): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row["name"]); ?></td>
                            <td><?php echo htmlspecialchars($row["priority"]); ?></td>
                            <td>
                                <button class="edit-btn" onclick="openEditPopup(<?php echo $row['id']; ?>, '<?php echo addslashes($row['name']); ?>', '<?php echo $row['priority']; ?>')">Edit</button>
                                <a href="add_category.php?delete=<?php echo $row['id']; ?>" onclick="return confirm('Are you sure you want to delete this category?')">
                                    <button class="delete-btn">Delete</button>
                                </a>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="3">No categories found.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <!-- Edit Popup -->
    <div id="editPopup" class="popup">
        <div class="popup-content">
            <form method="POST" action="">
                <h3>Edit Category</h3>
                <input type="hidden" id="edit_category_id" name="category_id">
                
                <label for="edit_category_name">Category Name:</label>
                <input type="text" id="edit_category_name" name="category_name" required>

                <label for="edit_priority">Priority:</label>
                <select id="edit_priority" name="priority" required>
                    <option value="Emergency">Emergency</option>
                    <option value="Urgent">Urgent</option>
                    <option value="Normal">Normal</option>
                </select>

                <button type="submit" name="edit_category">Update Category</button>
                <button type="button" onclick="closeEditPopup()">Cancel</button>
            </form>
        </div>
    </div>

    <script>
        function openEditPopup(id, name, priority) {
            document.getElementById('edit_category_id').value = id;
            document.getElementById('edit_category_name').value = name;
            document.getElementById('edit_priority').value = priority;

            document.getElementById('editPopup').classList.add('show');
        }

        function closeEditPopup() {
            document.getElementById('editPopup').classList.remove('show');
        }
    </script>
</body>
</html>