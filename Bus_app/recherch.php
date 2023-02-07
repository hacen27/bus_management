<?php 
	include 'database.php';
	
	
//if ((isset($_POST['action'])) {
    //echo '<br />The ' . $_POST['submit'] . ' submit button was pressed<br />';(isset($_POST['action']))
	
	$date_dep = $_POST['date-dep'];
	$garre_dep = $_POST['garre_dep'];
	$garre_arrive = $_POST['garre_arrive'];
	//$date-dep = date('Y-m-d', strtotime($_POST['date-dep']));

   $sql  = " SELECT * FROM `chaffeur`,`bus`,`voyage`WHERE(bus.idbus=voyage.idvoy AND bus.idbus=chaffeur.idchouff AND '$garre_dep' LIKE garre_dep AND '$garre_arrive' LIKE garre_arrive AND '$date_dep' LIKE voyage.date_dep )" ; 

 
	
	$query = $link->query($sql);
	$result = array();

   while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);
	
   