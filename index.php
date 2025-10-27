<?php
require 'db.php';
require 'functions.php';

$pdo = db();

$stmt = $pdo->prepare(sqlselectfromproducts());
$stmt->execute();

$productresults = $stmt->fetchAll(PDO::FETCH_ASSOC);

$stmt = $pdo->prepare(sqlcustomerorders());
$stmt->execute();

$customerresults = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam 2</title>
</head>
<body>
    <table>
        <th>
            Products
        </th>
        <tr>
            <th>name</th>
            <th>price</th>
        </tr>
        <tbody>
            <?php foreach ($productresults as $row): ?>
            <tr>
                <td><?php echo htmlspecialchars($row['name']); ?></td>
                <td><?php echo htmlspecialchars($row['price']); ?></td>
            </tr>
            <?php endforeach; ?>

        </tbody>
    </table>
    <table>
        <th>
            Customer Orders
        </th>
        <tr>
            <th>Customer</th>
            <th>Orders</th>
            <th>total spent</th>
        </tr>
        <tbody>
            <?php foreach ($customerresults as $row): ?>
            <tr>
                <td><?php echo htmlspecialchars($row['first_name']); ?></td>
                <td><?php echo htmlspecialchars($row['last_name']); ?></td>
                <td><?php echo htmlspecialchars($row['order_count']); ?></td>
                <td><?php echo htmlspecialchars($row['total_spent']); ?></td>
            </tr>
            <?php endforeach; ?>

        </tbody>
    </table>
    
</body>

<?php require 'components/footer.php' ?>
</html>