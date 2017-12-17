<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
	</head>
	<body>

		<?php
			$dataType = $_GET['dataType'];
			$con = pg_connect("host=localhost port=8887 dbname=Test user=postgres password=123") or die("Could not connect");
			if($dataType == "answer"){
   				pg_query($con, "UPDATE users SET ".$_GET['questionId']." = ".$_GET['globalId']." WHERE id = ".$_GET['userId']."");
    				pg_close($con);
    			}
    			if($dataType == "score"){
    				pg_query($con, "UPDATE users SET score = ".$_GET['score'].", total = ".$_GET['total']." WHERE id = ".$_GET['userId']."");
    				pg_close($con);
    			}
		?>
	</body>
</html>
