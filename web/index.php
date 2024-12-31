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

// Assuming user session contains their ID
$userId = $_SESSION['emp_id'];
$result = $conn->query("SELECT emp_pfp FROM employee WHERE emp_id = $userId");
$userProfilePicUrl = $result->fetch_assoc()['emp_pfp'] ?? 'uploads/profile_pictures/default.avif'; // Use default image if none exists

$isTechnician = ($_SESSION["role"] !== 1);
$isAdmin = ($userId == '999');

if (isset($_GET['yearmonth'])) {
    $_SESSION['yearmonth'] = $_GET['yearmonth'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <script src="https://kit.fontawesome.com/4b768977d9.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="index.css">
    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="header">
        <div class="fan"><i class="fa-solid fa-fan"></i></div> <!-- FAN -->
        <div class="space"></div>
        <h3>
            <span style="color: #0da6c2;">N</span>
            <span style="color: #f89e0e;">G</span>
            <span style="color: #ed6dbb;">A</span>
            <span style="color: #ffde59;">E</span>
            <span style="color: #38b6ff;">N</span>
            <span style="color: #c453d1;">G</span>
        </h3>
        <div class="info-btn">
            i
            <div class="tooltip">
                <h3>Instructions</h3>
                <p>
                    <u>Welcome to the main page!</u> Here, you can:
                </p>
                <ul>
                    <li>Submit new complaints using the <span class="highlight">"ADD COMPLAINT"</span> button.</li>
                    <li>Search for complaints using the search icon.</li>
                    <li>Sort complaints by name, date, or status using the filter icon.</li>
                </ul>
            </div>
        </div>
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
            <div class="user-infomation">
                <p>Welcome, <?php echo $_SESSION["name"]?></p>
                <p>Role : <?php echo $_SESSION["role"]?></p>
                <p>ID : <?php echo $_SESSION["emp_id"]?></p>
                <p>Department Code : <?php echo $_SESSION["dep_code"]?></p>
            </div>

            <!-- ปุ่ม Edit Password -->
            <div class="edit-password-container">
                <a href="change_password.php">
                    <button class="edit-password-btn">Change Password</button>
                </a>
            </div>
        </div>
        <div class="item2"><a href="index.php?logout=1"><button class="logout-btn"><i id="logout-btn" class="fa-solid fa-right-from-bracket"></i></button></a></div>
    </div>
    <div class="main">
        <div class="btn-area">
            <div class="space"></div>
            <a href="add.php">
                <button class="add-btn"><i class="fa-solid fa-pen-to-square"></i> ADD COMPLAINT</button>
            </a>
        </div>
        <div class="content">
            <div class="content-btn-area">
                <?php
                if (isset($_GET['yearmonth']) && empty($_SESSION['yearmonth'])) {
                    $head = "All-Time";
                } else if (isset($_GET['yearmonth']) && !empty($_SESSION['yearmonth'])) {
                    $head = $_SESSION['yearmonth'];
                } else {
                    $head = date('Y-m');
                }
                ?>
                <span id='month'><?php echo $head;?></span>
                <div class="space"></div>
                <a hreh="#"><button class="date-btn" onclick="togglePopupDate()"><i class="fa-regular fa-calendar"></i></button></a>
                <a hreh="#"><button class="search-btn" onclick="togglePopupSearch()"><i class="fa-solid fa-magnifying-glass"></i></button></a>
                <a hreh="#"><button class="filter-btn" onclick="togglePopupSort()"><i class="fa-solid fa-filter"></i></button></a>
            </div>
            <div class="complaint-header">
                <b class="grid-item1">Complaints</b>
                <b class="grid-item2">Date</b>
                <b class="grid-item3">By</b>
                <b class="grid-item4">Progress</b>
                <p class="grid-item5"></p>
            </div>
            <div class="popup-date" id="popupDate">
                <form method="GET" action ="">
                    <label for="month">Select Year and Month:</label>
                    <input type="month" id="month" name="yearmonth">
                    <button type="submit">Submit</button>
                </form>
            </div>
            <div class="popup-search" id="popupSearch">
                <form method="GET" action="">
                    <input type="text" placeholder="Search complaint.." name="search">
                    <button type="submit">Search</button>
                </form>
            </div>
            <div class="popup-sort" id="popupSort">
                <form method="GET" action="">
                    <!-- Dropdown for selecting sort type -->
                    <label for="sort">Sort by:</label>
                    <select name="sort" id="sort">
                        <option value="com_time" <?php echo isset($_GET['sort']) && $_GET['sort'] == 'com_time' ? 'selected' : ''; ?>>Date</option>
                        <option value="com_name" <?php echo isset($_GET['sort']) && $_GET['sort'] == 'com_name' ? 'selected' : ''; ?>>Name</option>
                        <option value="com_status" <?php echo isset($_GET['sort']) && $_GET['sort'] == 'com_status' ? 'selected' : ''; ?>>Status</option>
                        <option value="com_level" <?php echo isset($_GET['sort']) && $_GET['sort'] == 'com_level' ? 'selected' : ''; ?>>Severity</option>
                    </select>
                    <button type="submit">Sort</button>
                </form>
            </div>

            <?php
            // Check if a sort option has been selected
            $sortColumn = isset($_GET['sort']) ? $_GET['sort'] : 'com_time'; // Default to 'com_time' if no sort selected

            // สร้างเงื่อนไขการจัดเรียง
            $orderBy = ($sortColumn === 'com_level') ? "ORDER BY FIELD(com_level, 'Emergency', 'Urgent', 'Normal')" : "ORDER BY $sortColumn";
            $orderDESC = ($sortColumn === 'com_status') ? "DESC" : "ASC";

            // Chech if Search
            $search = isset($_GET['search']) && !empty($_GET['search']);
            $date = isset($_SESSION['yearmonth']);

            if ($search) {
                $s = mysqli_real_escape_string($conn, $_GET['search']);
                $sql = "SELECT * FROM complaint WHERE com_name LIKE '%$s%'";
            } else if ($date) {
                $d = mysqli_real_escape_string($conn,$_SESSION['yearmonth']);
                $sql = "SELECT * FROM complaint WHERE com_time LIKE '$d%' $orderBy $orderDESC";
            } else {
                $sql = "SELECT * FROM complaint WHERE MONTH(com_time) = MONTH(CURRENT_DATE()) AND YEAR(com_time) = YEAR(CURRENT_DATE()) $orderBy $orderDESC";
            }
            // SQL query to select all rows from the complaint table with dynamic sorting
            $query = mysqli_query($conn, $sql);
            if (!$query) {
                die("SQL Error: " . mysqli_error($conn)); // Output error and stop execution
            }

            // Check if there are any results
            if (mysqli_num_rows($query) > 0) {
                $index = 0;
                // Fetch the complaint details for each row and check ownership
                while ($result = mysqli_fetch_assoc($query)) {

                    $colorMapping = [
                        'Emergency' => 'c1',  // สีแดง
                        'Urgent' => 'c2',     // สีเหลือง
                        'Normal' => 'c3',     // สีเขียว
                    ];
                    
                    $color = $colorMapping[$result["com_level"]] ?? 'c3';


                    $complaintId = $result["com_id"];
                    $complaintName = htmlspecialchars($result["com_name"]);
                    $complaintDetail = htmlspecialchars($result["com_detail"]);
                    
                    $status = htmlspecialchars($result["com_status"]);
                    
                    // Check if the logged-in user is the owner of the complaint
                    $isOwner = ($result["emp_id"] == $userId);
                    
                    echo '<div class="complaint">';
                    echo '<div class="complaint-grid">';
                    echo '<div class="grid-item1 ' . $color . '">' . $complaintName . '</div>';
                    echo '<div class="grid-item2">' . htmlspecialchars($result["com_time"]) . '</div>';
                    echo '<div class="grid-item3">' . htmlspecialchars($result["emp_id"]) . '</div>';
                    echo '<div class="grid-item4 ' . $status . '">' . $status . '</div>';
                    
                    // Toggle button for additional details
                    echo '<div class="grid-item5"><a href="#" onclick="toggleBox(event, ' . $index . '); return false;"><i class="fa-solid fa-caret-down"></i></a></div>';
                    echo '</div>';

                    // Hidden box for details
                    echo '<div class="complaint-box" id="complaint-box-' . $index . '" style="display: none;">';
                    echo '<div class="grid-item1">' . htmlspecialchars($result["com_detail"]) . '</div>';
                    
                    // Show the Edit button only for the owner of the complaint
                    if ($isOwner || $isTechnician) {
                        echo '<div class="grid-item2">
                                <a href="#" 
                                onclick="openEditPopup(
                                    \'' . htmlspecialchars($complaintId, ENT_QUOTES) . '\',
                                    ' . ($isTechnician ? 'true' : 'false') . ',
                                    ' . ($isOwner ? 'true' : 'false') . ',
                                    ' . ($isAdmin ? 'true' : 'false') . ',
                                    \'' . htmlspecialchars($complaintName, ENT_QUOTES) . '\',
                                    \'' . htmlspecialchars($complaintDetail, ENT_QUOTES) . '\',
                                    \'' . htmlspecialchars($status, ENT_QUOTES) . '\',
                                    \'' . htmlspecialchars($_SESSION["role"]) . '\'
                                ); 
                                return false;">
                                <i class="fa-solid fa-pen"></i> Edit
                                </a>
                            </div>';
                    }
                    echo '</div></div>';

                    $index++;
                }

            } else {
                echo '<div class="complaint-empty"><img src="uploads/website/noComplaintImage.jpg"></div>';
            }
            ?>
        </div>
    </div>

    <div class="popup">
        <!-- Edit Complaint Form Popup -->
        <div id="editComplaintPopup" class="edit-popup">
            <div class="popup-content">
            <form id="editComplaintForm" action="edit_complaint.php" method="POST">
                <h3>Edit Complaint</h3>
                <input type="hidden" id="editComId" name="com_id" value="">
                <input type="hidden" id="editisTech" name="isTech" value="">

                <!-- Complaint Name Field -->
                <div id="comNameField">
                    <label for="com_name">Complaint Name:</label>
                    <input type="text" id="com_name" name="com_name" required>
                </div>

                <!-- Complaint Details Field -->
                <div id="comDetailField">
                    <label for="com_detail">Complaint Details:</label>
                    <textarea id="com_detail" name="com_detail" required></textarea>
                </div>

                <!-- Complaint Status Field -->
                <div id="comStatusField">
                    <label for="com_status">Status:</label>
                    <select name="com_status" id="com_status" required>
                        <option value="Waiting">Waiting</option>
                        <option value="In-Progress">In-Progress</option>
                        <option value="Completed">Completed</option>
                    </select>
                </div>

                <button type="submit">Update</button>
                <button type="button" onclick="closeEditPopup()">Cancel</button>
                <button type="button" id="deleteComplaintButton" onclick="deleteComplaint()">Delete Complaint</button>
            </form>

            </div>
        </div>
    </div>

    <div class="footer">
        <h3>
            <span style="color: #0da6c2;">N</span>
            <span style="color: #f89e0e;">G</span>
            <span style="color: #ed6dbb;">A</span>
            <span style="color: #ffde59;">E</span>
            <span style="color: #38b6ff;">N</span>
            <span style="color: #c453d1;">G</span>
        </h3>
        <a href="admin.php">Admin</a>
    </div>

    <script>
    // JavaScript function to toggle the visibility of Box 2
    function toggleBox(event, i) {
    event.preventDefault();

    // Select the complaint box and caret icon
    const box = document.getElementsByClassName("complaint-box");
    const caret = document.getElementsByClassName("fa-caret-down");

    // Toggle display for the complaint box
    box[i].style.display = box[i].style.display === "none" || box[i].style.display === "" ? "grid" : "none";

    // Check current rotation and toggle it
    const currentRotation = caret[i].style.transform;
    caret[i].style.transform = currentRotation === "rotateZ(180deg)" ? "rotateZ(0deg)" : "rotateZ(180deg)";
    }


    function togglePopupSort() {
    const popup = document.getElementById('popupSort');
    popup.classList.toggle('show'); // Toggle 'show' class to activate the animation
    }

    function togglePopupSearch() {
    const popup = document.getElementById('popupSearch');
    popup.classList.toggle('show'); // Toggle 'show' class to activate the animation
    }

    function togglePopupDate() {
    const popup = document.getElementById('popupDate');
    popup.classList.toggle('show'); // Toggle 'show' class to activate the animation
    }
    
    const pfp = document.getElementById("pfp");
    pfp.addEventListener("click",togglePopupPfp);
    function togglePopupPfp() {
        const popup = document.getElementById('pfp-popup');
        popup.classList.toggle('show');
    }

    function openEditPopup(complaintId, isTechnician, isOwner, isAdmin, complaintName, complaintDetail, complaintStatus, role) {
    // Set the form values
    document.getElementById('editComId').value = complaintId;
    document.getElementById('editisTech').value = isTechnician;
    document.getElementById('com_name').value = complaintName;
    document.getElementById('com_detail').value = complaintDetail;
    document.getElementById('com_status').value = complaintStatus;

    // Role-based field visibility
    if (role === 1) { // Role is 1
        document.getElementById('comNameField').style.display = 'block';
        document.getElementById('comDetailField').style.display = 'block';
        document.getElementById('comStatusField').style.display = 'none';
    } else if (isOwner || isAdmin) { // Role is not 1 but isOwner
        document.getElementById('comNameField').style.display = 'block';
        document.getElementById('comDetailField').style.display = 'block';
        document.getElementById('comStatusField').style.display = 'block';
    } else { // Role is not 1
        document.getElementById('comNameField').style.display = 'none';
        document.getElementById('comDetailField').style.display = 'none';
        document.getElementById('comStatusField').style.display = 'block';
    }

    // Show the Edit popup
    document.querySelector('.popup').classList.add('show');
    }


    // Close the popup form
    function closeEditPopup() {
        document.querySelector('.popup').classList.remove('show');
    }

    // Delete Complaint function
    function deleteComplaint() {
        if (confirm('Are you sure you want to delete this complaint?')) {
            const comId = document.getElementById('editComId').value;
            window.location.href = 'edit_complaint.php?delete=true&com_id=' + comId;  // Call delete function in PHP
        }
    }
    </script>   
</body>
</html>




