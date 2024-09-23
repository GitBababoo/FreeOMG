<?php
session_start();

// Include database connection file
include 'connect_db.php';

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    header('Location: /Dynamic66/auth/login.php');
    exit();
}

// Handle deletion of a product
if (isset($_GET['id'])) {
    $prod_id = intval($_GET['id']);

    if ($prod_id > 0) {
        // Prepare the SQL statement for deletion
        $sql = "DELETE FROM product WHERE prod_id = ?";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("i", $prod_id);
            if ($stmt->execute()) {
                // Redirect back to product_show.php with success message
                header("Location: product_show.php?msg=Product deleted successfully.");
                exit();
            } else {
                $message = "Error deleting product: " . htmlspecialchars($stmt->error);
            }
            $stmt->close();
        } else {
            $message = "Error preparing statement: " . htmlspecialchars($conn->error);
        }
    } else {
        $message = "Invalid product ID.";
    }
} else {
    $message = "No product ID provided.";
}

// Close the database connection
$conn->close();

// Output message if any
if (isset($message)) {
    echo "<p>$message</p>";
    echo "<a href='product_show.php'>Back to Product List</a>";
}
?>
