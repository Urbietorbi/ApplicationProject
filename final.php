<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>Final</title>
		<link rel="stylesheet" type="text/css" href="./style.css"/>
	</head>
	<body>
		<fieldset>
			<p style = "font-size: 40px"><b>Paldies, <?php echo $_POST["userName"]; ?>!</b></p>
			<p style = "font-size: 22px">Tu atbildeji pareizi uz <?php echo $_POST["score"]; ?> no <?php echo $_POST["counter"]; ?> jautājumiem</p>
		</fieldset>
	</body>
</html>
