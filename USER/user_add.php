<?php
include 'connect_db.php';

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: /Dynamic66/auth/login.php');
    exit();
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $prod_name = $_POST['prod_name'] ?? '';
    $prod_desc = $_POST['prod_desc'] ?? '';
    $pty_id = $_POST['pty_id'] ?? '';
    $prod_show = $_POST['prod_show'] ?? '';

    if ($prod_name && $prod_desc && $pty_id !== '' && $prod_show !== '') {
        // SQL query to insert product into the database
        $sql = "INSERT INTO product (prod_name, prod_desc, pty_id, prod_show) VALUES (?, ?, ?, ?)";

        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("ssii", $prod_name, $prod_desc, $pty_id, $prod_show);
            if ($stmt->execute()) {
                echo "<p>เพิ่มข้อมูลผลิตภัณฑ์สำเร็จ</p>";
            } else {
                echo "<p>เกิดข้อผิดพลาด: " . $stmt->error . "</p>";
            }
            $stmt->close();
        } else {
            echo "<p>ไม่สามารถเตรียมคำสั่ง SQL ได้</p>";
        }
    } else {
        echo "<p>กรุณากรอกข้อมูลให้ครบถ้วน</p>";
    }
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เพิ่มข้อมูลผลิตภัณฑ์</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"],
        .button-cancel {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
        }
        input[type="submit"] {
            background-color: #007bff;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .button-cancel {
            background-color: #6c757d;
            text-decoration: none;
        }
        .button-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
<h1>เพิ่มข้อมูลผลิตภัณฑ์</h1>

<form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" name="frmproductadd" id="frmproductadd" onsubmit="return chkdata();">
    <label for="prod_name">ชื่อผลิตภัณฑ์:</label>
    <input type="text" id="prod_name" name="prod_name" required>

    <label for="prod_desc">คำอธิบาย:</label>
    <input type="text" id="prod_desc" name="prod_desc" required>

    <label for="pty_id">ประเภทสินค้า:</label>
    <select id="pty_id" name="pty_id" required>
        <!-- Populate this dropdown with product types from the database -->
        <?php
        $sql = "SELECT pty_id, pty_name FROM product_type";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<option value='" . $row['pty_id'] . "'>" . $row['pty_name'] . "</option>";
            }
        }
        ?>
    </select>

    <label for="prod_show">แสดงข้อมูล:</label>
    <select id="prod_show" name="prod_show" required>
        <option value="0">ไม่แสดง</option>
        <option value="1">แสดง</option>
    </select>

    <input type="submit" value="ตกลง">
    <a href="product_show.php" class="button-cancel">ยกเลิก</a>
</form>

<script type="text/javascript">
    function chkdata() {
        let txtError = "กรุณากรอก ";
        let showError = false;

        let name = document.getElementById('prod_name').value.trim();
        let desc = document.getElementById('prod_desc').value.trim();
        let ptyId = document.getElementById('pty_id').value;
        let prodShow = document.getElementById('prod_show').value;

        if (name === "") {
            showError = true;
            txtError += "ชื่อผลิตภัณฑ์ ";
        }

        if (desc === "") {
            showError = true;
            txtError += "คำอธิบาย ";
        }

        if (ptyId === "") {
            showError = true;
            txtError += "ประเภทสินค้า ";
        }

        if (prodShow === "") {
            showError = true;
            txtError += "แสดงข้อมูล";
        }

        if (showError) {
            alert(txtError);
            return false;
        }

        return true;
    }
</script>
</body>
</html>
