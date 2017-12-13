 <html>
 <head>
 <meta charset="UTF-8"/>
 <title>Testa uzdevums kandidātam</title>
 <link rel="stylesheet" type="text/css" href="./style.css"/>

 <?php
  $dbconn = pg_connect("host=localhost port=8887 dbname=Test user=postgres password=123") or die("Could not connect");
  $tests = pg_query($dbconn, "SELECT DISTINCT testname FROM questions");
  if (!$tests) {
    echo "An error occurred.\n";
    exit;
  }
  $arr = pg_fetch_all_columns($tests);
  ?>

 </head>
 <body style="font-family:verdana">
 <br><p style="text-align:center; font-size:26px;"><b>Testa uzdevums</b></p>
 <form target="_self"; action="./test.php"; method="post"; style="position:relative; text-align:center; display: block">
   <fieldset style="border:none">
	<input name="userName" required type="text" placeholder="Ievadi savu vārdu" style="position:relative; width:20%; margin:5px auto; " ><br>
	<select name="testName" required style="width:17%; margin:5px auto">
		<option value="" disabled selected>Izvelies testu..</option>
		<?php 
      foreach($arr as $value) {
      echo '<option value="' . $value . '">' . $value . '</option>';
      }
    ?>
	</select>
	<input type="submit" value="Sākt" style="position: relative; text-align:center; width:15%; margin:5px auto; display:block">
   </fieldset>
</form>
</body>
</html>