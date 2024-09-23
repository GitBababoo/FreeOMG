<?php
session_start();
include 'connect_db.php';

if (!isset($_SESSION['username'])) {
    header('Location: /Dynamic66/auth/login.php');
    exit();
}

function displayTable(mysqli $conn, int $showStatus, string $header, string $cssClass) {
    $sql = "SELECT p.prod_id, p.prod_name, p.prod_desc, pt.pty_name 
            FROM product p
            JOIN product_type pt ON p.pty_id = pt.pty_id
            WHERE p.prod_show = ?";

    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        die("Error preparing statement: " . $conn->error);
    }

    $stmt->bind_param("i", $showStatus);

    if (!$stmt->execute()) {
        die("Error executing statement: " . $stmt->error);
    }

    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "<h2>$header</h2>
        <table class='$cssClass'>
        <thead>
        <tr>
        <th>Product ID</th>
        <th>Product Name</th>
        <th>Description</th>
        <th>Product Type</th>
        </tr>
        </thead>
        <tbody>";

        while ($row = $result->fetch_assoc()) {
            echo "<tr>
            <td>{$row["prod_id"]}</td>
            <td>{$row["prod_name"]}</td>
            <td>{$row["prod_desc"]}</td>
            <td>{$row["pty_name"]}</td>
            </tr>";
        }

        echo "</tbody>
        </table>";
    } else {
        echo "No products found.";
    }

    $stmt->close();
}

// Display products based on show status
displayTable($conn, 1, 'Active Products', 'active-products');
displayTable($conn, 0, 'Inactive Products', 'inactive-products');

// Display all products with edit and delete links
$sql = "SELECT p.prod_id, p.prod_name, p.prod_desc, pt.pty_name 
        FROM product p
        JOIN product_type pt ON p.pty_id = pt.pty_id";
$result = $conn->query($sql);

if (!$result) {
    die("Error executing query: " . $conn->error);
}

if ($result->num_rows > 0) {
    echo "<h2>Manage Products</h2>
    <table class='manage-products'>
    <thead>
    <tr>
    <th>Product ID</th>
    <th>Product Name</th>
    <th>Description</th>
    <th>Product Type</th>
    <th>Edit</th>
    <th>Delete</th>
    </tr>
    </thead>
    <tbody>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
        <td>{$row["prod_id"]}</td>
        <td>{$row["prod_name"]}</td>
        <td>{$row["prod_desc"]}</td>
        <td>{$row["pty_name"]}</td>
        <td><a href='product_edit.php?id={$row["prod_id"]}'>Edit</a></td>
        <td><a href='product_delete.php?id={$row["prod_id"]}'>Delete</a></td>
        </tr>";
    }

    echo "</tbody>
    </table>";
} else {
    echo "No products found.";
}

$conn->close();
?>
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding-top: 60px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
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
        button:hover {
            background-color: #0056b3;
        }
        .active-products { /* styles for active products table */ }
        .inactive-products { /* styles for inactive products table */ }
        .manage-products { /* styles for manage products table */ }
    </style>
</head>
<body>
<button onclick="window.location.href='product_add.php'">Add Product</button>
</body>
</html>
