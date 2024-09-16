<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php

$name = "Dynamic";
echo "$name";
echo "<br>";
session_start();
$_SESSION['name'] = "พบวัถุ";
echo $_SESSION['name']; 

?>



<br>    <a href="http://localhost/Dynamic66/1.PHP">หน้า 1</a>
</body>
</html>