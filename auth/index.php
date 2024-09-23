<?php

session_start();


if (!isset($_SESSION['username'])) {
    header('Location: /Dynamic66/auth/login.php');
    exit();
}

$directory = __DIR__;
$files = array_diff(scandir($directory), array('.', '..'));

function formatSize($size) {
    if ($size >= 1048576) {
        return number_format($size / 1048576, 2) . ' MB';
    } elseif ($size >= 1024) {
        return number_format($size / 1024, 2) . ' KB';
    } elseif ($size > 1) {
        return $size . ' bytes';
    } elseif ($size == 1) {
        return $size . ' byte';
    } else {
        return '0 bytes';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File Directory</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>File Directory</h1>
    <table>
        <thead>
        <tr>
            <th>Icon</th>
            <th>Name</th>
            <th>Last Modified</th>
            <th>Size</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($files as $file): ?>
            <tr>
                <td><?php echo is_dir($file) ? '<img src="folder-icon.png" alt="Folder" />' : '<img src="file-icon.png" alt="File" />'; ?></td>
                <td><a href="<?php echo $file; ?>"><?php echo $file; ?></a></td>
                <td><?php echo date("Y-m-d H:i", filemtime($file)); ?></td>
                <td><?php echo is_file($file) ? formatSize(filesize($file)) : '-'; ?></td>
                <td><?php echo 'Description here'; ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>
</body>
</html>
