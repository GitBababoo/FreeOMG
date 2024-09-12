<?php
include 'connect_db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $mmb_username = $_POST['mmb_username'] ?? '';
    $mmb_pwd = $_POST['mmb_pwd'] ?? '';
    $mmb_show = $_POST['mmb_show'] ?? '';

    if ($user_name && $user_surname) {
        $sql = "INSERT INTO member (mmb_username, mmb_pwd, mmb_show) VALUES (?, ?, ?)";

        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("sss", $mmb_username, $mmb_pwd, $mmb_show);
            if ($stmt->execute()) {
                echo "<p>เพิ่มข้อมูลผู้ใช้สำเร็จ</p>";
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
    <title>member</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        form {
            max-width: 400px;
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
    <h1>เพิ่มข้อมูลผู้ใช้</h1>

    <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" name="frmpersonaledit" id="frmpersonaledit" onsubmit="return chkdata();">
        <label for="user_name">ชื่อผู้ใช้งาน:</label>
        <input type="text" id="mmb_username" name="mmb_username" required>

        <label for="mmb_pwd">รหัสผ่าน:</label>
        <input type="text" id="mmb_pwd" name="mmb_pwd" required>

        <label for="mmb_show">แสดงข้อมูล:</label>
        <select id="mmb_show" name="mmb_show">
            <option value="">กรุณาเลือก</option>
            <option value="0">ไม่แสดง</option>
            <option value="1">แสดง</option>
        </select>

        <input type="submit" value="ตกลง">
        <a href=".php" class="button-cancel">ยกเลิก</a>
    </form>

    <script type="text/javascript">
        function chkdata() {
            let txtError = "กรุณากรอก ";
            let showError = false;

            let name = document.getElementById('mmb_username').value.trim();
            let surname = document.getElementById('mmb_pwd').value.trim();
            let userShow = document.getElementById('mmb_show').value;

            if (name === "") {
                showError = true;
                txtError += "ชื่อผู้ใช้งาน ";
            }

            if (surname === "") {
                showError = true;
                txtError += "รหัสผ่าน" ";
            }

            if (userShow === "") {
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
