<?php
session_start();
include("fetch_report_data.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports</title>
    <link rel="stylesheet" href="report.css">
</head>
<body>
    <div class="container">
        <a href="admin.php" class="exit">
            <span>Back</span>
        </a>
        <h1>Complaint Statistics</h1>

        <canvas id="myChart" width="400" height="200"></canvas>

        <div class="card">
            <h2>Total Complaints</h2>
            <p><?php echo $totalComplaints; ?></p>
        </div>

        <div class="card">
            <h2>Complaints by Department</h2>
            <table>
                <thead>
                    <tr>
                        <th>Department</th>
                        <th>Count</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($departments as $department): ?>
                        <tr>
                            <td><?php echo $department['dep_name']; ?></td>
                            <td><?php echo $department['count']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>

        <div class="card">
            <h2>Complaints by Status</h2>
            <table>
                <thead>
                    <tr>
                        <th>Status</th>
                        <th>Count</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($statuses as $status): ?>
                        <tr>
                            <td><?php echo $status['com_status']; ?></td>
                            <td><?php echo $status['count']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>

        <div class="card">
            <h2>Complaints by Role</h2>
            <table>
                <thead>
                    <tr>
                        <th>Role</th>
                        <th>Count</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($roles as $role): ?>
                        <tr>
                            <td><?php echo $role['role']; ?></td>
                            <td><?php echo $role['count']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const ctx = document.getElementById('myChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar', // Choose 'line', 'pie', 'doughnut', etc.
                data: {
                    labels: categories, // Data passed from PHP
                    datasets: [{
                        label: 'Number of Complaints by Category',
                        data: counts, // Data passed from PHP
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });
        </script>
</body>
</html>
