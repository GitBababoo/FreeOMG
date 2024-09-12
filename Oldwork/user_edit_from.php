<?php
require_once('connection.php');

// Check if the user ID is provided in the URL
if (isset($_GET['id'])) {
    $user_id = $_GET['id'];

    // Retrieve user data based on the ID
    $sql = "SELECT * FROM user WHERE user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $user_name = $row['user_name'];
        $user_surname = $row['user_surname'];
    } else {
        // Handle case when user ID is not found
        echo "User not found.";
        exit;
    }
} else {
    // Handle case when user ID is not provided in the URL
    echo "User ID is missing.";
    exit;
}
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
    <form action="user_update_process.php" method="POST">
        <input type="hidden" name="id" value="<?php echo $user_id; ?>">

        <label for="user_name">Name:</label>
        <input type="text" name="user_name" id="user_name" value="<?php echo $user_name; ?>" required><br><br>

        <label for="user_surname">Surname:</label>
        <input type="text" name="user_surname" id="user_surname" value="<?php echo $user_surname; ?>" required><br><br>

        <button type="submit">Update</button>
    </form>
</body>
</html>