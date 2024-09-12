<?php
include 'connect_db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_name = $_POST['user_name'] ?? '';
    $user_surname = $_POST['user_surname'] ?? '';
    $user_show = $_POST['user_show'] ?? '';

    if ($user_name && $user_surname) {
        $sql = "INSERT INTO users (user_name, user_surname, user_show) VALUES (?, ?, ?)";

        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("sss", $user_name, $user_surname, $user_show);
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
    <title>เพิ่มข้อมูลผู้ใช้</title>
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
        <label for="user_name">ชื่อ:</label>
        <input type="text" id="user_name" name="user_name" required>

        <label for="user_surname">นามสกุล:</label>
        <input type="text" id="user_surname" name="user_surname" required>

        <label for="user_show">แสดงข้อมูล:</label>
        <select id="user_show" name="user_show">
            <option value="">กรุณาเลือก</option>
            <option value="0">ไม่แสดง</option>
            <option value="1">แสดง</option>
        </select>

        <input type="submit" value="ตกลง">
        <a href="user_show.php" class="button-cancel">ยกเลิก</a>
    </form>

    <script type="text/javascript">
        function chkdata() {
            let txtError = "กรุณากรอก ";
            let showError = false;

            let name = document.getElementById('user_name').value.trim();
            let surname = document.getElementById('user_surname').value.trim();
            let userShow = document.getElementById('user_show').value;

            if (name === "") {
                showError = true;
                txtError += "ชื่อ ";
            }

            if (surname === "") {
                showError = true;
                txtError += "นามสกุล ";
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
