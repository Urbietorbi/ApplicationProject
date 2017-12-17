 <html>
 <head>
 <meta charset="UTF-8"/>
 <title>Testa uzdevums kandidātam</title>
 <link rel="stylesheet" type="text/css" href="./style.css"/>
  <?php
    $dbconn = pg_connect("host=localhost port=8887 dbname=Test user=postgres password=123") or die("Could not connect");
    $tests = pg_query($dbconn, "SELECT DISTINCT testname FROM questions");
    $arr = pg_fetch_all_columns($tests);
    pg_close($dbconn);
  ?>
 </head>
 <body>
 <fieldset>
 <p style="font-size:40px"><b>Testa uzdevums</b></p>
 <form target="_self"; action="./test.php"; method="post">
	   <input name="userName" required type="text" placeholder="Ievadi savu vārdu">
	   <select name="testName" required>
		  <option value="" disabled selected>Izvēlies testu..</option>
		    <?php 
          foreach($arr as $value) {
            echo '<option value="'.$value.'">'.$value.'</option>';
          }
        ?>
	   </select>
	   <input type="submit" value="Sākt" style="width:15%; min-width: 100px">
   </fieldset>
</form>
</body>
</html>