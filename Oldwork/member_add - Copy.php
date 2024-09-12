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

$mmb_name = "aa";
$mmb_surname = "bb";
$mmb_username = "username"; 
$mmb_pwd = "password";      
$mmb_addr = "Some Address"; 
$mmb_phone = "1234567890"; 

$sql_script = "INSERT INTO student (mmb_name, mmb_surname, mmb_username, mmb_pwd, mmb_addr, mmb_phone) VALUES ('$mmb_name', '$mmb_surname', '$mmb_username', '$mmb_pwd', '$mmb_addr', '$mmb_phone')";

// Execute the SQL query
if ($result = mysqli_query($conn, $sql_script)) {
  echo "New user added successfully!";
} else {
  echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>