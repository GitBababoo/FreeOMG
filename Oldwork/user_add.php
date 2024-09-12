<?php
require_once('connection.php');

$sql_script = "INSERT INTO user (user_name, user_surname) VALUES ('aa', 'bb')";

// Execute the SQL query
if ($result = mysqli_query($conn, $sql_script)) {
  echo "New user added successfully!";
} else {
  echo "Error: " . mysqli_error($conn); 
}

// ปิดการเชื่อมต่อฐานข้อมูล
mysqli_close($conn);
?>
