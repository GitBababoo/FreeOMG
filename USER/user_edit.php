<?php
// เชื่อมต่อกับฐานข้อมูล
include 'connect_db.php';

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: /Dynamic66/auth/login.php');
    exit();
}

// ตรวจสอบว่ามีการส่งข้อมูลหรือไม่
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // รับข้อมูลจากฟอร์ม
    $user_id = $_POST['user_id'];
    $user_name = $_POST['user_name'];
    $user_surname = $_POST['user_surname'];
    $user_show = $_POST['user_show'];

    // ตรวจสอบข้อมูลที่ได้รับ
    if (!empty($user_id) && !empty($user_name) && !empty($user_surname)) {
        // สร้างคำสั่ง SQL สำหรับการอัปเดตข้อมูล
        $sql = "UPDATE users SET user_name = ?, user_surname = ?, user_show = ? WHERE user_id = ?";

        // เตรียมคำสั่ง SQL
        if ($stmt = $conn->prepare($sql)) {
            // ผูกตัวแปรกับคำสั่ง SQL
            $stmt->bind_param("sssi", $user_name, $user_surname, $user_show, $user_id);

            // ดำเนินการคำสั่ง SQL
            if ($stmt->execute()) {
                echo "<p>อัปเดตข้อมูลผู้ใช้สำเร็จ</p>";
                echo "<a href='user_show.php'>กลับไปที่หน้าแสดงข้อมูล</a>";
            } else {
                echo "<p>เกิดข้อผิดพลาด: " . $stmt->error . "</p>";
            }

            // ปิดคำสั่ง SQL
            $stmt->close();
        } else {
            echo "<p>ไม่สามารถเตรียมคำสั่ง SQL ได้</p>";
        }
    } else {
        echo "<p>กรุณากรอกข้อมูลให้ครบถ้วน</p>";
    }
} else {
    // ดึงข้อมูลผู้ใช้ที่ต้องการแก้ไข
    $user_id = $_GET['id'];
    if (!empty($user_id)) {
        $sql = "SELECT user_name, user_surname, user_show FROM users WHERE user_id = ?";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("i", $user_id);
            $stmt->execute();
            $stmt->bind_result($user_name, $user_surname, $user_show);
            $stmt->fetch();
            $stmt->close();
        } else {
            echo "<p>ไม่สามารถเตรียมคำสั่ง SQL ได้</p>";
        }
    } else {
        echo "<p>ไม่พบข้อมูลผู้ใช้</p>";
    }
}

// ปิดการเชื่อมต่อ
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แก้ไขข้อมูลผู้ใช้</title>
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
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .button-cancel {
            background-color: #6c757d;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .button-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<h1>แก้ไขข้อมูลผู้ใช้</h1>

<form action="user_edit.php" method="post">
    <input type="hidden" name="user_id" value="<?php echo htmlspecialchars($user_id); ?>">

    <label for="user_name">ชื่อ:</label>
    <input type="text" id="user_name" name="user_name" value="<?php echo htmlspecialchars($user_name); ?>" required>

    <label for="user_surname">นามสกุล:</label>
    <input type="text" id="user_surname" name="user_surname" value="<?php echo htmlspecialchars($user_surname); ?>" required>

    <label for="user_show">แสดงข้อมูล:</label>
    <select id="user_show" name="user_show">
        <option value="0" <?php if ($user_show == 0) echo "selected"; ?>>ไม่แสดง</option>
        <option value="1" <?php if ($user_show == 1) echo "selected"; ?>>แสดง</option>
    </select>

    <input type="submit" value="ตกลง">
    <a href="user_show.php" class="button-cancel">ยกเลิก</a>
</form>

</body>
</html>