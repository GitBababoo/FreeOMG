<?php
include 'connect_db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve and escape form data
    $mmb_id = (int)$_POST['mmb_id'];
    $mmb_name = mysqli_real_escape_string($conn, trim($_POST['mmb_name']));
    $mmb_surname = mysqli_real_escape_string($conn, trim($_POST['mmb_surname']));
    $mmb_username = mysqli_real_escape_string($conn, trim($_POST['mmb_username']));
    $mmb_pwd = mysqli_real_escape_string($conn, trim($_POST['mmb_pwd']));
    $mmb_addr = mysqli_real_escape_string($conn, trim($_POST['mmb_addr']));
    $mmb_phone = mysqli_real_escape_string($conn, trim($_POST['mmb_phone']));
    $mmb_show = (int)$_POST['user_show'];

    // Prepare and execute the SQL statement
    $stmt = $conn->prepare("UPDATE member SET mmb_name = ?, mmb_surname = ?, mmb_username = ?, mmb_pwd = ?, mmb_addr = ?, mmb_phone = ?, mmb_show = ? WHERE mmb_id = ?");
    $stmt->bind_param("ssssssii", $mmb_name, $mmb_surname, $mmb_username, $mmb_pwd, $mmb_addr, $mmb_phone, $mmb_show, $mmb_id);

    if ($stmt->execute()) {
        echo "<div class='alert alert-success' role='alert'>Record updated successfully</div>";
    } else {
        echo "<div class='alert alert-danger' role='alert'>Error: " . htmlspecialchars($stmt->error) . "</div>";
    }

    $stmt->close();
    $conn->close();
} else {
    // Load member data for editing
    $mmb_id = (int)$_GET['id'];
    $stmt = $conn->prepare("SELECT * FROM member WHERE mmb_id = ?");
    $stmt->bind_param("i", $mmb_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $member = $result->fetch_assoc();
    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Member</title>
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
    <h1 class="mb-4">Edit Member</h1>
    <form action="member_edit.php" method="post" onsubmit="return chkdata();">
        <input type="hidden" name="mmb_id" value="<?= htmlspecialchars($member['mmb_id']) ?>">
        <div class="mb-3">
            <label for="mmb_name" class="form-label">First Name:</label>
            <input type="text" id="mmb_name" name="mmb_name" class="form-control" value="<?= htmlspecialchars($member['mmb_name']) ?>" required>
        </div>

        <div class="mb-3">
            <label for="mmb_surname" class="form-label">Last Name:</label>
            <input type="text" id="mmb_surname" name="mmb_surname" class="form-control" value="<?= htmlspecialchars($member['mmb_surname']) ?>" required>
        </div>

        <div class="mb-3">
            <label for="mmb_username" class="form-label">Username:</label>
            <input type="text" id="mmb_username" name="mmb_username" class="form-control" value="<?= htmlspecialchars($member['mmb_username']) ?>" required>
        </div>

        <div class="mb-3">
            <label for="mmb_pwd" class="form-label">Password:</label>
            <input type="password" id="mmb_pwd" name="mmb_pwd" class="form-control" value="<?= htmlspecialchars($member['mmb_pwd']) ?>" required>
        </div>

        <div class="mb-3">
            <label for="mmb_addr" class="form-label">Address:</label>
            <input type="text" id="mmb_addr" name="mmb_addr" class="form-control" value="<?= htmlspecialchars($member['mmb_addr']) ?>" required>
        </div>

        <div class="mb-3">
            <label for="mmb_phone" class="form-label">Phone:</label>
            <input type="text" id="mmb_phone" name="mmb_phone" class="form-control" value="<?= htmlspecialchars($member['mmb_phone']) ?>" required>
        </div>

        <div class="mb-3">
            <label for="user_show" class="form-label">Display Status:</label>
            <select id="user_show" name="user_show" class="form-select" required>
                <option value="0" <?= $member['mmb_show'] == 0 ? 'selected' : '' ?>>Not Display</option>
                <option value="1" <?= $member['mmb_show'] == 1 ? 'selected' : '' ?>>Display</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Update Member</button>
        <a href="member_show.php" class="button-cancel">Cancel</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
