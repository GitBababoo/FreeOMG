<?php
session_start();

// Include database connection file
include 'connect_db.php';

// Check if user is logged in
if (!isset($_SESSION['username'])) {
    header('Location: /Dynamic66/auth/login.php');
    exit();
}

// Initialize variables
$prod_id = $_GET['id'] ?? '';
$error_message = '';
$success_message = '';

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $prod_name = $_POST['prod_name'] ?? '';
    $prod_desc = $_POST['prod_desc'] ?? '';
    $pty_id = $_POST['pty_id'] ?? '';
    $prod_show = $_POST['prod_show'] ?? '';

    if ($prod_name && $prod_desc && $pty_id !== '' && $prod_show !== '') {
        // Prepare the SQL statement
        $sql = "UPDATE product SET prod_name = ?, prod_desc = ?, pty_id = ?, prod_show = ? WHERE prod_id = ?";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("ssiii", $prod_name, $prod_desc, $pty_id, $prod_show, $prod_id);
            if ($stmt->execute()) {
                $success_message = "Product updated successfully.";
                header('Location: product_list.php');
                exit();
            } else {
                $error_message = "Error updating product: " . htmlspecialchars($stmt->error);
            }
            $stmt->close();
        } else {
            $error_message = "Error preparing statement: " . htmlspecialchars($conn->error);
        }
    } else {
        $error_message = "Please fill in all fields.";
    }
}

// Fetch product details
if ($prod_id) {
    $sql = "SELECT prod_name, prod_desc, pty_id, prod_show FROM product WHERE prod_id = ?";
    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param("i", $prod_id);
        $stmt->execute();
        $stmt->bind_result($prod_name, $prod_desc, $pty_id, $prod_show);
        $stmt->fetch();
        $stmt->close();
    } else {
        die("Error preparing statement: " . htmlspecialchars($conn->error));
    }
}

// Fetch product types for dropdown
$product_types = [];
$sql = "SELECT pty_id, pty_name FROM product_type";
if ($result = $conn->query($sql)) {
    while ($row = $result->fetch_assoc()) {
        $product_types[] = $row;
    }
    $result->free();
} else {
    die("Error executing query: " . htmlspecialchars($conn->error));
}

// Close the database connection
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        form { max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px; background-color: #f9f9f9; }
        label { display: block; margin-bottom: 8px; }
        input[type="text"], select { width: 100%; padding: 8px; margin-bottom: 12px; border: 1px solid #ddd; border-radius: 4px; }
        input[type="submit"], .button-cancel { padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; color: white; }
        input[type="submit"] { background-color: #007bff; }
        input[type="submit"]:hover { background-color: #0056b3; }
        .button-cancel { background-color: #6c757d; text-decoration: none; }
        .button-cancel:hover { background-color: #5a6268; }
        .error { color: red; }
        .success { color: green; }
    </style>
</head>
<body>
<h1>Edit Product</h1>

<?php if ($error_message): ?>
    <p class="error"><?php echo $error_message; ?></p>
<?php endif; ?>

<?php if ($success_message): ?>
    <p class="success"><?php echo $success_message; ?></p>
<?php endif; ?>

<form method="POST" action="">
    <label for="prod_name">Product Name:</label>
    <input type="text" id="prod_name" name="prod_name" value="<?php echo htmlspecialchars($prod_name); ?>" required>

    <label for="prod_desc">Description:</label>
    <input type="text" id="prod_desc" name="prod_desc" value="<?php echo htmlspecialchars($prod_desc); ?>" required>

    <label for="pty_id">Product Type:</label>
    <select id="pty_id" name="pty_id" required>
        <?php foreach ($product_types as $type): ?>
            <option value="<?php echo $type['pty_id']; ?>" <?php echo ($type['pty_id'] == $pty_id) ? 'selected' : ''; ?>>
                <?php echo htmlspecialchars($type['pty_name']); ?>
            </option>
        <?php endforeach; ?>
    </select>

    <label for="prod_show">Show Product:</label>
    <select id="prod_show" name="prod_show" required>
        <option value="1" <?php echo ($prod_show == '1') ? 'selected' : ''; ?>>Show</option>
        <option value="0" <?php echo ($prod_show == '0') ? 'selected' : ''; ?>>Hide</option>
    </select>

    <input type="submit" value="Update">
    <a href="product_list.php" class="button-cancel">Cancel</a>
</form>

</body>
</html>
