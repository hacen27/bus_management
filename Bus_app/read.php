<?php 

	
include 'database.php';

	$query = $link->query("SELECT * FROM `chaffeur`,`bus`,`voyage`WHERE(bus.idbus=voyage.idvoy AND bus.idbus=chaffeur.idchouff)");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);










































// include 'database.php';

// 	$query = $link->query('SELECT * FROM person');
// 	$result = array();

// 	while ($rowdata = $query->fetch_assoc()) {
// 		$result[] = $rowdata;
// 	}
// 	echo json_encode($result);