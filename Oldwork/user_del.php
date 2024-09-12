<?php
require_once('connection.php'); 


$sql = "DELETE FROM user WHERE user_id = 26"; 


if (mysqli_query($conn, $sql)) {
    echo "User deleted successfully!"; 
} else {
    echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
