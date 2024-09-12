<?php
require_once('connection.php');

$fname = $_POST['fname'];
$lname = $_POST['lname'];

$sql = "INSERT INTO user (user_name, user_surname) VALUES ('$fname', '$lname')";
mysqli_query($conn, $sql);

echo "ชื่อ : $fname<br>";
echo "นามสกุล : $lname<br>";
echo $sql;

mysqli_close($conn);
?>