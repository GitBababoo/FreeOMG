<?php

session_start();
include 'connect_db.php';

if (!isset($_SESSION['username'])) {
    header('Location: /Dynamic66/auth/login.php');
    exit();
}

// กำหนดพาธฐานของโปรเจกต์
$base_path = '/Dynamic66/';

// สร้างอาเรย์ของโฟลเดอร์
$folders = ['USER' => 'Users', 'product' => 'Products', 'member' => 'Members', 'auth' => 'Authentication', 'includes' => 'Includes'];

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index Page</title>
    <style>
        body {
            font-family: sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 600px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .folder-links {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 20px;
        }

        .folder-link {
            text-align: center;
            background-color: #e9ecef;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .folder-link:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }

        .folder-link a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            display: block;
            padding: 10px 0;
            transition: color 0.3s;
        }

        .folder-link a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>เลือกโฟลเดอร์</h1>
    <div class="folder-links">
        <?php foreach ($folders as $folder => $displayName): ?>
            <div class="folder-link">
                <a href="<?= $base_path . $folder ?>/"><?= htmlspecialchars($displayName) ?></a>
            </div>
        <?php endforeach; ?>
    </div>
</div>
</body>
</html>
