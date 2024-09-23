<?php
include 'connect_db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve and escape form data
    $data = array_map(fn($item) => mysqli_real_escape_string($conn, trim($item)), $_POST);
    $data['user_show'] = (int)$data['user_show'];

    // Prepare and execute the SQL statement
    $stmt = $conn->prepare("INSERT INTO member (mmb_name, mmb_surname, mmb_username, mmb_pwd, mmb_addr, mmb_phone, mmb_show) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssi", $data['mmb_name'], $data['mmb_surname'], $data['mmb_username'], $data['mmb_pwd'], $data['mmb_addr'], $data['mmb_phone'], $data['user_show']);

    echo $stmt->execute() ? "<div class='alert alert-success' role='alert'>New record created successfully</div>" :
        "<div class='alert alert-danger' role='alert'>Error: " . htmlspecialchars($stmt->error) . "</div>";

    $stmt->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Member</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
        .button-cancel {
            display: inline-block;
            margin-left: 10px;
            padding: 10px 15px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .button-cancel:hover {
            background-color: #5a6268;
        }
    </style>
    <script>
        function chkdata() {
            const fields = ['mmb_name', 'mmb_surname', 'mmb_username', 'mmb_pwd', 'mmb_addr', 'mmb_phone', 'user_show'];
            const missing = fields.filter(id => !document.getElementById(id).value.trim()).map(id => {
                switch(id) {
                    case 'mmb_name': return "First Name";
                    case 'mmb_surname': return "Last Name";
                    case 'mmb_username': return "Username";
                    case 'mmb_pwd': return "Password";
                    case 'mmb_addr': return "Address";
                    case 'mmb_phone': return "Phone";
                    case 'user_show': return "Display Status";
                }
            });
            if (missing.length) {
                alert(`Please fill in the following fields: ${missing.join(", ")}`);
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Add New Member</h1>
    <form action="member_add.php" method="post" onsubmit="return chkdata();">
        <div class="mb-3">
            <label for="mmb_name" class="form-label">First Name:</label>
            <input type="text" id="mmb_name" name="mmb_name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="mmb_surname" class="form-label">Last Name:</label>
            <input type="text" id="mmb_surname" name="mmb_surname" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="mmb_username" class="form-label">Username:</label>
            <input type="text" id="mmb_username" name="mmb_username" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="mmb_pwd" class="form-label">Password:</label>
            <input type="password" id="mmb_pwd" name="mmb_pwd" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="mmb_addr" class="form-label">Address:</label>
            <input type="text" id="mmb_addr" name="mmb_addr" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="mmb_phone" class="form-label">Phone:</label>
            <input type="text" id="mmb_phone" name="mmb_phone" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="user_show" class="form-label">Display Status:</label>
            <select id="user_show" name="user_show" class="form-select" required>
                <option value="">Select</option>
                <option value="0">Not Display</option>
                <option value="1">Display</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Add Member</button>
        <a href="member_show.php" class="button-cancel">Cancel</a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
