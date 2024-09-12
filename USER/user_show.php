<?php
include 'connect_db.php';

// ฟังก์ชันสำหรับแสดงตารางข้อมูล
function displayTable($conn, $condition, $header, $cssClass) {
    $sql = "SELECT * FROM users WHERE user_show = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $condition);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        echo "<h2>$header</h2>
        <table class='$cssClass'>
        <thead>
        <tr>
        <th>ID</th>
        <th>NAME - SURNAME</th>
        </tr>
        </thead>
        <tbody>";
        
        while($row = $result->fetch_assoc()) {
            echo "<tr>
            <td>{$row["user_id"]}</td>
            <td>{$row["user_name"]} {$row["user_surname"]}</td>
            </tr>";
        }
        
        echo "</tbody>
        </table>";
    } else {
        echo "ไม่มีข้อมูล";
    }
    $stmt->close();
}

// แสดงข้อมูลตามเงื่อนไข
displayTable($conn, 1, 'user แสดงข้อมูล', 'show-data');
displayTable($conn, 0, 'user_ ไม่แสดงข้อมูล', 'hide-data');

// แสดงข้อมูลทั้งหมด พร้อมลิงก์แก้ไขและลบ
$sql = "SELECT * FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<h2>จัดการ User Show</h2>
    <table class='manage-users'>
    <thead>
    <tr>
    <th>ID</th>
    <th>NAME - SURNAME</th>
    <th></th>
    <th></th>
    </tr>
    </thead>
    <tbody>";
    
    while($row = $result->fetch_assoc()) {
        echo "<tr>
        <td>{$row["user_id"]}</td>
        <td>{$row["user_name"]} {$row["user_surname"]}</td>
        <td><a href='user_edit.php?id={$row["user_id"]}'>Edit</a></td>
        <td><a href='user_delete.php?id={$row["user_id"]}'>Delete</a></td>
        </tr>";
    }
    
    echo "</tbody>
    </table>";
} else {
    echo "ไม่มีข้อมูล";
}

$conn->close();
?>

<style>
body { font-family: Arial, sans-serif; margin: 20px; padding-top: 60px; }
table { width: 100%; border-collapse: collapse; margin-top: 20px; }
table, th, td { border: 1px solid #ddd; }
th, td { padding: 8px; text-align: left; }
th { background-color: #f4f4f4; }
a { color: #007bff; text-decoration: none; }
a:hover { text-decoration: underline; }
button { 
    position: fixed; 
    top: 20px; 
    right: 20px; 
    padding: 10px 15px; 
    font-size: 16px; 
    background-color: #007bff; 
    color: white; 
    border: none; 
    border-radius: 5px; 
    cursor: pointer; 
    z-index: 1000; 
}
button:hover { background-color: #0056b3; }
.show-data { /* styles for show data table */ }
.hide-data { /* styles for hide data table */ }
.manage-users { /* styles for manage users table */ }
</style>

<button onclick="window.location.href='user_add.php'">เพิ่มข้อมูล</button>
