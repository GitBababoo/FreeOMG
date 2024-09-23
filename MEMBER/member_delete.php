<?php
include 'connect_db.php';

// Check if the request is a POST request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve member ID from POST data
    $mmb_id = (int)$_POST['id'];

    // Prepare and execute the SQL statement
    $stmt = $conn->prepare("DELETE FROM member WHERE mmb_id = ?");
    $stmt->bind_param("i", $mmb_id);

    if ($stmt->execute()) {
        echo "Record deleted successfully";
    } else {
        echo "Error: " . htmlspecialchars($stmt->error);
    }

    $stmt->close();
    $conn->close();
}
?>
