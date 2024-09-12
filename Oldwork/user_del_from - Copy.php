<?php
require_once('connection.php');

// Check if the user ID is provided
if (!isset($_POST['id']) || empty($_POST['id'])) {
    die("User ID not provided.");
}

$user_id = $_POST['id'];

// Fetch the current details of the user
$sql_script = "SELECT * FROM user WHERE user_id = ?";
$stmt = $conn->prepare($sql_script);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows !== 1) {
    die("User not found.");
}

$user = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
</head>
<body>
    <h2>Update User Information</h2>
    <form id="updateForm" method="post" action="user_update_process.php">
        <input type="hidden" name="id" value="<?php echo htmlspecialchars($user['user_id']); ?>">
        
        <label for="fname">First Name:</label><br>
        <input type="text" id="fname" name="fname" value="<?php echo htmlspecialchars($user['user_name']); ?>" required><br>

        <label for="lname">Last Name:</label><br>
        <input type="text" id="lname" name="lname" value="<?php echo htmlspecialchars($user['user_surname']); ?>" required><br><br>

        <input type="submit" value="Update">
    </form>
    <br><a href="user_list.php">Back to User List</a><br>
</body>
</html>
