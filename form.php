<html>
	<head>
		<title>PHP Beispiel</title>
	</head>
	<body>
		<h1>Übungsbeispiel 1</h1>
		<form action="suche.php" method="POST">
			Marke: <select name="marke">
			<option value="">--ALLE--</option>
<?PHP
	$link = mysqli_connect("localhost", "root", "", "lap_autos");
  
	// Verbindung erfolgreich
	if ($link === false) {
		die("ERROR: Could not connect. "
                .mysqli_connect_error());
	}
  
	// Daten abfragen
	$sql = "SELECT idMARKEN, MARKENBez FROM MARKEN order by MARKENBez";
	
	if ($res = mysqli_query($link, $sql)) {
		// wurden Datens�tze gefunden
		if (mysqli_num_rows($res) > 0) {
			// und alle Datens�tze durchlaufen
			while ($row = mysqli_fetch_array($res)) {
				echo '<option value="'.$row['idMarken'].'">'.$row['MARKENBez']."</option>";
        }
			mysqli_free_result($res);
		} else {
			echo "No matching records are found.";
		}
	}
	else {
		echo "ERROR: Could not able to execute $sql. "
                                .mysqli_error($link);
	}

	mysqli_close($link);

?>
			</select>
			<br>
			Leistung: <input type="text" name="leistung">
			<br>
			<input type="submit" value="ABSENDEN">
		</form>
		<table border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>Marke</td>
				<td>Modell</td>
				<td>Leistung</td>
			</tr>
			<tr>
				<td>VW</td>
				<td>id5</td>
				<td>75 KW</td>
			</tr>
			<tr>
				<td>Audi</td>
				<td>A6</td>
				<td>100 KW</td>
			</tr>
		</table>
	</body>
</html>