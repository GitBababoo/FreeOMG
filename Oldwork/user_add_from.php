<?php
require_once('connection.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User_Add</title>
</head>
<body>
<form id="from" name="form1" method="post" action="show_user_add.php"> 
  <label for="fname">ชื่อ:</label><br>
  <input type="text" id="fname" name="fname"><br>
  <label for="lname">นามสกุล:</label><br>
  <input type="text" id="lname" name="lname">
  <br><input type="submit" value="ตกลง"><br>
</form>
</body>