<?PHP

	var_dump($_POST);
	// wurde Datem übermittelt?
	if (isset($_POST['marke'])) {
		echo "<br> gesendet wurde: MARKE = ".$_POST['marke']." <br> Leistung = ".$_POST['leistung'];	
	} else {
		die("Keine Daten übermittelt!");
	}
	
	// wenn Daten vorhanden, DB-Verbindung aufbauen
	
	// Daten abfragen
	
	// Daten ausgeben
	$link = mysqli_connect("localhost", "root", "", "lap_autos");
  
	// Verbindung erfolgreich
	if ($link === false) {
		die("ERROR: Could not connect. "
                .mysqli_connect_error());
	}
  
	// Daten abfragen
	$sql = "SELECT idMODELLE, MODELLEBez, MODELLELeistung, MODELLETueren, MARKENBez 
			FROM modelle inner join marken on modelle.MARKEN_idMARKEN = marken.idMARKEN where 1 ";

	// SQL INJECTION VERMEIDEN mit .intval
	if (!empty($_POST['marke'])) {
		$sql .= " AND MARKEN_idMARKEN = ".intval($_POST['marke']);		
	}

	if (!empty($_POST['leistung'])) {
		$sql .= " AND MODELLELeistung = ".intval($_POST['leistung']);
	}

	echo $sql."<br><br>";
	
	if ($res = mysqli_query($link, $sql)) {
		// wurden Datensätze gefunden
		if (mysqli_num_rows($res) > 0) {
			// Dann Tabellenkopf ausgeben
			echo "<table>";
			echo "<tr>";
			echo "<th>marke</th>";
			echo "<th>Modell</th>";
			echo "<th>Leistung</th>";
			echo "<th>Türen</th>";
			echo "</tr>";
			// und alle Datensätze durchlaufen
			while ($row = mysqli_fetch_array($res)) {
				echo "<tr>";
				echo "<td>".$row['MARKENBez']."</td>";
				echo "<td>".$row['MODELLEBez']."</td>";
				echo "<td>".$row['MODELLELeistung']."</td>";
				echo "<td>".$row['MODELLETueren']."</td>";
				echo "</tr>";
        }
			echo "</table>";
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