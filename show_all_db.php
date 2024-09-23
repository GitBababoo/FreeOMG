<?php
include 'connect_db.php'; // รวมไฟล์เชื่อมต่อฐานข้อมูล

// รายการตารางที่ต้องการดึงข้อมูล
$tables = ['member', 'product', 'product_type', 'student', 'uploadimages', 'users'];

// สร้างตาราง HTML
echo "<table border='1' cellspacing='0' cellpadding='5'>
<tr>
<th>Table Name</th>
<th>Data</th>
</tr>";

foreach ($tables as $table) {
    // ดึงข้อมูลจากแต่ละตาราง
    $sql = "SELECT * FROM $table";
    $result = $conn->query($sql);
    
    // เช็คผลลัพธ์และแสดงข้อมูล
    if ($result && $result->num_rows > 0) {
        $data = "<table border='1' cellspacing='0' cellpadding='5'><tr>";
        
        // แสดงชื่อคอลัมน์
        while ($field = $result->fetch_field()) {
            $data .= "<th>" . htmlspecialchars($field->name) . "</th>";
        }
        $data .= "</tr>";
        
        // แสดงข้อมูลแต่ละแถว
        while ($row = $result->fetch_assoc()) {
            $data .= "<tr>";
            foreach ($row as $value) {
                $data .= "<td>" . htmlspecialchars($value) . "</td>";
            }
            $data .= "</tr>";
        }
        $data .= "</table>";
    } else {
        $data = "No data found";
    }
    
    echo "<tr>
    <td>" . htmlspecialchars($table) . "</td>
    <td>$data</td>
    </tr>";
}

echo "</table>";

// ปิดการเชื่อมต่อ
$conn->close();
?>
