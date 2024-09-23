<?php
session_start();

// Include database connection file
include 'connect_db.php';

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    header('Location: /Dynamic66/auth/login.php');
    exit();
}

// Function to display a data table
function displayTable(mysqli $conn, int $condition, string $header, string $cssClass) {
    $stmt = $conn->prepare("SELECT * FROM member WHERE mmb_show = ?");
    $stmt->bind_param("i", $condition);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "<h2>$header</h2>
              <table class='table table-striped $cssClass'>
              <thead>
              <tr>
              <th>ID</th>
              <th>Name - Surname</th>
              <th>Username</th>
              <th>Address</th>
              <th>Phone</th>
              </tr>
              </thead>
              <tbody>";

        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                  <td>{$row['mmb_id']}</td>
                  <td>{$row['mmb_name']} {$row['mmb_surname']}</td>
                  <td>{$row['mmb_username']}</td>
                  <td>{$row['mmb_addr']}</td>
                  <td>{$row['mmb_phone']}</td>
                  </tr>";
        }

        echo "</tbody></table>";
    } else {
        echo "<div class='alert alert-info' role='alert'>ไม่มีข้อมูล</div>";
    }

    $stmt->close();
}

// Display data based on the condition
displayTable($conn, 1, 'Members Showing', 'show-data');
displayTable($conn, 0, 'Members Not Showing', 'hide-data');

// Display all members with actions
$result = $conn->query("SELECT * FROM member");

if ($result->num_rows > 0) {
    echo "<h2>Manage Members</h2>
          <table class='table table-bordered manage-members'>
          <thead>
          <tr>
          <th>ID</th>
          <th>Name - Surname</th>
          <th>Username</th>
          <th>Address</th>
          <th>Phone</th>
          <th>Actions</th>
          </tr>
          </thead>
          <tbody>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
              <td>{$row['mmb_id']}</td>
              <td>{$row['mmb_name']} {$row['mmb_surname']}</td>
              <td>{$row['mmb_username']}</td>
              <td>{$row['mmb_addr']}</td>
              <td>{$row['mmb_phone']}</td>
              <td>
                  <a href='member_edit.php?id={$row['mmb_id']}' class='btn btn-warning btn-sm'>Edit</a>
                  <button class='btn btn-danger btn-sm' onclick='deleteMember({$row['mmb_id']})'>Delete</button>
              </td>
              </tr>";
    }

    echo "</tbody></table>";
} else {
    echo "<div class='alert alert-info' role='alert'>ไม่มีข้อมูล</div>";
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Show</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding-top: 60px;
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        .show-data, .hide-data, .manage-members {
            border: 1px solid #ddd;
        }
        .fixed-button {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 10px 15px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            z-index: 1000;
            transition: background-color 0.3s;
        }
        .fixed-button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function deleteMember(id) {
            if (confirm('Are you sure you want to delete this member?')) {
                fetch('member_delete.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        'id': id
                    })
                })
                    .then(response => response.text())
                    .then(result => {
                        // Reload the page to reflect changes
                        location.reload();
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            }
        }
    </script>
</head>
<body>
<div class="container">
    <button onclick="window.location.href='member_add.php'" class="fixed-button">เพิ่มข้อมูล</button>
</div>

<!-- Bootstrap JavaScript (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
