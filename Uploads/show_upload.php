<?php
include 'connect_db.php';

$sql = "SELECT img_id, image_name FROM uploadimages";
$result = mysqli_query($conn, $sql);

if ($result && mysqli_num_rows($result) > 0) {
    echo "<table border='1'>
            <tr>
                <th>Image ID</th>
                <th>Image Name</th>
                <th>Image</th>
            </tr>";

    while ($row = mysqli_fetch_assoc($result)) {
        $imagePath = 'uploads/' . htmlspecialchars($row['image_name']);
        echo "<tr>
                <td>" . htmlspecialchars($row['img_id']) . "</td>
                <td>" . htmlspecialchars($row['image_name']) . "</td>
                <td><img src='{$imagePath}' alt='Image' style='width:100px; height:auto;'></td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "ไม่มีข้อมูลในตาราง";
}

echo "<button onclick=\"window.location.href='add_img.php'\">เพิ่มข้อมูล</button>";

mysqli_close($conn);
?>
