<!DOCTYPE html>
<html>
<head>

</head>
<body>

<?php
    $con = pg_connect("host=localhost port=8887 dbname=Test user=postgres password=123") or die("Could not connect");
    pg_query($con, "UPDATE users SET ".$_GET['questionId']." = ".$_GET['globalId']." WHERE id = ".$_GET['userId']."");
    pg_close($con);
?>
</body>
</html>