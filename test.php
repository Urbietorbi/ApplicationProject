<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Test page</title>
	<link rel="stylesheet" type="text/css" href="./style.css"/>
	<script type="text/javascript" src="./test.js"></script>
</head>
<body>
	<?php
		$dbconn = pg_connect("host=localhost port=8887 dbname=Test user=postgres password=123") or die("Could not connect");

		$questions = pg_query($dbconn, "SELECT questionid, question, answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9, answer10 from questions WHERE testname = '".$_POST['testName']."'");
    $rows = pg_num_rows($questions);

    $result = pg_query($dbconn, "INSERT INTO users (username, testname) VALUES ('".$_POST['userName']."', '".$_POST['testName']."') RETURNING id");
    $row = pg_fetch_row($result);
    $id = $row[0];
  			
  	echo "<script>getData(".$rows.",'".$_POST['userName']."',".$id.")</script>";

  	for($i=0; $i<$rows; $i++){
      $arr = pg_fetch_assoc($questions, $i);
  		foreach($arr as $value){
  			if($value != null){
  				echo "<script>getQuestions('".$value."',".$i.")</script>";
  			}
  		}
  	}
    pg_close($dbconn);
	?>
	<script>createForm();</script>
</body>
</html>