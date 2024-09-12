<?php
require_once('connection.php'); 


$sql = "UPDATE user SET user_name = 'aa', user_surname = 'bb' WHERE user_id = 100"; 


if (mysqli_query($conn, $sql)) {
    echo "User updated successfully!";
} else {
    echo "Error: " . mysqli_error($conn);
}


mysqli_close($conn);
?>
