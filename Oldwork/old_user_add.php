<?php
header('Content-Type: text/html; charset=utf-8');

// Database credentials
$hostname = "localhost";
$uname = "root";
$pwd = "1234";
$dbname = "dynamic";

// Create connection
$conn = mysqli_connect($hostname, $uname, $pwd, $dbname);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

$sql_script = "INSERT INTO user (user_name, user_surname) VALUES ('aa', 'bb')";

// Execute the SQL query
if ($result = mysqli_query($conn, $sql_script)) {
  echo "New user added successfully!";
} else {
  echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>