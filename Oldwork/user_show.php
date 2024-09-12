<?php
require_once('connection.php');

// SQL query to fetch the first 10 users
$sql_script = "SELECT * FROM user LIMIT 10";
$result = $conn->query($sql_script);

if (!$result) {
    die("Error executing query: " . $conn->error);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center; /* Center text in all table cells */
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name-Surname</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Use mysqli_num_rows to check if there are any results
            if ($result->num_rows > 0) {
                $count = 1;
                while ($row_result = $result->fetch_assoc()) {
                    ?>
                    <tr>
                        <td><?php echo $count; ?></td>
                        <td><?php echo htmlspecialchars($row_result['user_name'] . ' ' . $row_result['user_surname']); ?></td>
                        <td>
                            <form action="user_del_from.php" method="POST">
                                <input type="hidden" name="id" value="<?php echo htmlspecialchars($row_result['user_id']); ?>">
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                        <td>
                            <form action="user_edit_from.php" method="POST">
                                <input type="hidden" name="id" value="<?php echo htmlspecialchars($row_result['user_id']); ?>">
                                <button type="submit">Update</button>
                            </form>
                        </td>
                    </tr>
                    <?php
                    $count++;
                }
            } else {
                ?>
                <tr>
                    <td colspan="4">No users found.</td>
                </tr>
                <?php
            }
            ?>
        </tbody>
    </table>
    <br><a href="user_add_from.php">เพิ่มข้อมูล</a><br>
</body>