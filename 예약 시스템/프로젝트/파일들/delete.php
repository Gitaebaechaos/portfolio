<?php
if (isset($_GET['id'])) {
	$id = $_GET['id'];
	
	$host = "localhost";
	$dbname = "restaurant";
	$username = "root" ;
	$password = "";

	//Create connection
	$conn = mysqli_connect($host,
						   $username,
						   $password,
						   $dbname);
						   
	$sql = "DELETE FROM register WHERE id=$id";
	$conn->query($sql);
}

header("location: http://localhost/wwwroot/database.php");
exit;
?>