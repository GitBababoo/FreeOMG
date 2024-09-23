<?php
include 'connect_db.php';

// ฟังก์ชันสำหรับดึงประเภทสินค้า
function getProductTypes($conn) {
    $sql = "SELECT pty_id, pty_name FROM product_type";
    $result = $conn->query($sql);

    if ($result === false) {
        throw new Exception("เกิดข้อผิดพลาดในการดึงข้อมูลประเภทสินค้า: " . $conn->error);
    }

    $types = [];
    while ($row = $result->fetch_assoc()) {
        $types[] = $row;
    }
    return $types;
}

// ตรวจสอบการส่งฟอร์ม
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $prod_name = $_POST['prod_name'] ?? '';
    $prod_desc = $_POST['prod_desc'] ?? '';
    $pty_id = $_POST['pty_id'] ?? '';
    $prod_show = $_POST['prod_show'] ?? '';

    // ตรวจสอบความถูกต้องของข้อมูล
    if ($prod_name && $prod_desc && $pty_id !== '' && $prod_show !== '') {
        // คำสั่ง SQL เพื่อเพิ่มข้อมูลผลิตภัณฑ์
        $sql = "INSERT INTO product (prod_name, prod_desc, pty_id, prod_show) VALUES (?, ?, ?, ?)";

        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("ssii", $prod_name, $prod_desc, $pty_id, $prod_show);
            if ($stmt->execute()) {
                echo "<p>เพิ่มข้อมูลผลิตภัณฑ์สำเร็จ</p>";
            } else {
                echo "<p>เกิดข้อผิดพลาด: " . htmlspecialchars($stmt->error) . "</p>";
            }
            $stmt->close();
        } else {
            echo "<p>ไม่สามารถเตรียมคำสั่ง SQL ได้</p>";
        }
    } else {
        echo "<p>กรุณากรอกข้อมูลให้ครบถ้วน</p>";
    }
}

// ดึงข้อมูลประเภทสินค้าจากฐานข้อมูลก่อนที่จะปิดการเชื่อมต่อ
try {
    $types = getProductTypes($conn);
} catch (Exception $e) {
    echo "<p>เกิดข้อผิดพลาดในการโหลดประเภทสินค้า: " . htmlspecialchars($e->getMessage()) . "</p>";
    $types = []; // กำหนดค่าเริ่มต้นให้เป็น array ว่างๆ
}

// ปิดการเชื่อมต่อฐานข้อมูลหลังจากทำงานเสร็จ
$conn->close();
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เพิ่มข้อมูลผลิตภัณฑ์</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        form { max-width: 600px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px; background-color: #f9f9f9; }
        label { display: block; margin-bottom: 8px; }
        input[type="text"], select { width: 100%; padding: 8px; margin-bottom: 12px; border: 1px solid #ddd; border-radius: 4px; }
        input[type="submit"], .button-cancel { padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; color: white; }
        input[type="submit"] { background-color: #007bff; }
        input[type="submit"]:hover { background-color: #0056b3; }
        .button-cancel { background-color: #6c757d; color: white; text-decoration: none; }
        .button-cancel:hover { background-color: #5a6268; }
    </style>
</head>
<body>
<h1>เพิ่มข้อมูลผลิตภัณฑ์</h1>

<form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" onsubmit="return validateForm();">
    <label for="prod_name">ชื่อผลิตภัณฑ์:</label>
    <input type="text" id="prod_name" name="prod_name" required>

    <label for="prod_desc">คำอธิบาย:</label>
    <input type="text" id="prod_desc" name="prod_desc" required>

    <label for="pty_id">ประเภทสินค้า:</label>
    <select id="pty_id" name="pty_id" required>
        <?php
        if (empty($types)) {
            echo "<option value=''>ไม่มีประเภทสินค้า</option>";
        } else {
            foreach ($types as $type) {
                echo "<option value='" . htmlspecialchars($type['pty_id']) . "'>" . htmlspecialchars($type['pty_name']) . "</option>";
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

<script>
    function validateForm() {
        const elements = document.querySelectorAll('input[required], select[required]');
        let isValid = true;

        elements.forEach(el => {
            if (!el.value.trim()) {
                alert(`กรุณากรอก ${el.previousElementSibling.innerText}`);
                isValid = false;
            }
        });

        return isValid;
    }
</script>
</body>
</html>
