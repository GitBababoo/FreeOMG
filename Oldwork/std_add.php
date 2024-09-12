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

// Prepare data for the student table
$std_name = "aa";    // Replace with actual student name
$std_surname = "bb"; // Replace with actual student surname

$sql_script = "INSERT INTO student (std_name, std_surname) VALUES ('$std_name', '$std_surname')";

// Execute the SQL query
if ($result = mysqli_query($conn, $sql_script)) {
  echo "New student added successfully!";
} else {
  echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>