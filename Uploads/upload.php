<?php
include 'connect_db.php';

$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

if (isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if ($check !== false) {
        $uploadOk = 1;
    } else {
        echo "ไฟล์ไม่ใช่ภาพ";
        $uploadOk = 0;
    }

    if (file_exists($target_file)) {
        echo "ขออภัย, ไฟล์มีอยู่แล้ว.";
        $uploadOk = 0;
    }

    if ($_FILES["fileToUpload"]["size"] > 500000) {
        echo "ขออภัย, ไฟล์ของคุณมีขนาดใหญ่เกินไป.";
        $uploadOk = 0;
    }

    if (!in_array($imageFileType, ['jpg', 'png', 'jpeg', 'gif'])) {
        echo "ขออภัย, อนุญาตเฉพาะไฟล์ JPG, JPEG, PNG & GIF.";
        $uploadOk = 0;
    }

    if ($uploadOk == 0) {
        echo "ขออภัย, ไฟล์ของคุณไม่สามารถอัปโหลดได้.";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            echo "ไฟล์ " . htmlspecialchars(basename($_FILES["fileToUpload"]["name"])) . " ได้ถูกอัปโหลดแล้ว.";

            $image_name = htmlspecialchars(basename($_FILES["fileToUpload"]["name"]));
            $sql_script = "INSERT INTO uploadimages (image_name) VALUES ('$image_name')";

            if (mysqli_query($conn, $sql_script)) {
                header('Location: show_upload.php');
                exit();
            } else {
                echo "เกิดข้อผิดพลาดในการบันทึกข้อมูล: " . mysqli_error($conn);
            }
        } else {
            echo "ขออภัย, เกิดข้อผิดพลาดในการอัปโหลดไฟล์ของคุณ.";
        }
    }
}

mysqli_close($conn);
?>
