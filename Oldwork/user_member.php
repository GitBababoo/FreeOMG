<?PHP
if ((isset($_POST["cmd_ok"])) && ($_POST["cmd_ok"] == "ตกลง")) {

  require_once("connection.php");


  $mmb_name = $_POST["mmb_name"];
  $mmb_surname = $_POST["mmb_surname"];
  $mmb_username = $_POST["mmb_username"];
  $mmb_pwd = $_POST["mmb_pwd"]; 
  
  // ใส่ password เข้าไปใน database
  $sql = "INSERT INTO member (mmb_name, mmb_surname, mmb_username, mmb_pwd) 
  VALUES ('$mmb_name', '$mmb_surname', '$mmb_username', '$mmb_pwd')";
  mysqli_query($conn, $sql) or die(mysqli_error($conn));
  
  // แสดงข้อมูลที่ใส่
  echo "ชื่อ : $mmb_name<br>"; 
  echo "นามสกุล : $mmb_surname<br>";
  echo "ชื่อผู้ใช้ : $mmb_username<br>";
  echo "รหัส : $mmb_pwd<br>";
  
  mysqli_close($conn);

}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form id="from" name="form1" method="post">

  <label for="mmb_name">mmb_name:</label>
  <input type="text" id="mmb_name" name="mmb_name"><br>

  <label for="mmb_surname">mmb_surname:</label>
  <input type="text" id="mmb_surname" name="mmb_surname"><br>

  <label for="mmb_username">mmb_username:</label>
  <input type="text" id="mmb_username" name="mmb_username"><br>

  <label for="mmb_pwd">mmb_pwd:</label>
  <input type="password" id="mmb_pwd" name="mmb_pwd"><br>

  <br><input type="submit" name="cmd_ok" id="cmd_ok" value="ตกลง"><br>
  <input type="button" name="cmd_cancel" id="cmd_cancel" value="ยกเลิก" onClick="document.location.href='.php'" />

</form>

</body>
</html>