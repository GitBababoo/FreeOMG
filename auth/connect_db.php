<?php
// ข้อมูลการเชื่อมต่อฐานข้อมูล
$servername = "127.0.0.1"; // ชื่อเซิร์ฟเวอร์ฐานข้อมูล (localhost สำหรับเซิร์ฟเวอร์เดียวกัน)
$username = "root"; // ชื่อผู้ใช้ฐานข้อมูล
$password = "1234"  ; // รหัสผ่านฐานข้อมูล
$database = "dynamic"; // ชื่อฐานข้อมูลที่ต้องการเชื่อมต่อ

// สร้างการเชื่อมต่อ
$conn = new mysqli($servername, $username, $password, $database);

// ตรวจสอบการเชื่อมต่อ
if ($conn->connect_error) {
    die("การเชื่อมต่อล้มเหลว: " . $conn->connect_error);
}
echo "เชื่อมต่อฐานข้อมูลสำเร็จ";

// ปิดการเชื่อมต่อเมื่อไม่ใช้
// $conn->close();
?>
