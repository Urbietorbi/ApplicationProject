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
		$q = $_POST['testName'];
		$dbconn = pg_connect("host=localhost port=8887 dbname=Test user=postgres password=123") or die("Could not connect");
		$questions = pg_query($dbconn, "SELECT * FROM questions WHERE testname = '".$q."'");
		$rows = pg_num_rows($questions);
  		if (!$questions) {
    		echo "An error occurred.\n";
    		exit;
  		}		
  	echo "<script>getNumOfRows(".$rows.")</script>";
  	for($i=0; $i<$rows; $i++){
      $arr = pg_fetch_assoc($questions, $i);
  		foreach($arr as $value){
  			if($value != null){
  				echo "<script>getQuestions('".$value."',".$i.")</script>";
  			}
  		}
  	}
  	$result = pg_query($dbconn, "INSERT INTO users (username, testname) VALUES ('".$_POST['userName']."', '".$_POST['testName']."') RETURNING id");
    $row = pg_fetch_row($result);
    $id = $row[0];
    echo '<input id="userId" type="hidden" value="'.$id.'"/>';
	?>
  
  <input id="nameInput" type="hidden" value="<?php echo $_POST["userName"]; ?>">
	<script>createForm();</script>
</body>
</html>