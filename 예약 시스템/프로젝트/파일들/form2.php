<?php

$date = filter_input(INPUT_POST, 'date');
$hour = filter_input(INPUT_POST, "hour");
$name = filter_input(INPUT_POST, 'name');
$phone = filter_input(INPUT_POST, 'phone');
$howManyPerson = filter_input(INPUT_POST, "howManyPerson", FILTER_VALIDATE_INT);
$email = filter_input(INPUT_POST, "email", FILTER_VALIDATE_EMAIL);

if ( ! $phone) {
    die("Phone must be accepted");
}

if ( ! $name) {
    die("Name must be accepted");
}

if ( ! $howManyPerson) {
    die("How many person must be accepted");
}

if ( ! $email) {
    die("Email must be accepted");
}

if ( ! $date) {
    die("Date must be accepted");
}

if ( ! $hour) {
    die("Hour must be accepted");
}

$host = "localhost";
$dbname = "restaurant";
$username = "root" ;
$password = "";

$conn = mysqli_connect($host,
                       $username,
                       $password,
                       $dbname);

if (mysqli_connect_errno()) {
    die("Connection error: " . mysqli_connect_error());
}

$sql = "INSERT INTO register2 (date, hour, name, phone, howManyPerson, email)
        VALUES (?, ?, ?, ?, ?, ?)";

$stmt = mysqli_stmt_init($conn);

if ( ! mysqli_stmt_prepare($stmt, $sql)) {

    die(mysqli_error($conn));
}

mysqli_stmt_bind_param($stmt, "ssssis",
                       $date, 
                       $hour,
                       $name,
                       $phone,
                       $howManyPerson,
					   $email);

mysqli_stmt_execute($stmt);

echo "Record saved successfully.....";


?>

<div class="form-row">
			<a href="http://localhost/wwwroot/htmlpage2.html">
                <button class="btn btn-outline-secondary", style = "color: blue;"> back</button>
            </a>
		</div>
		
<div class="form-row">
			<a href="http://localhost/wwwroot/statement2.php">
                <button class="btn btn-outline-secondary", style = "color: blue;"> View Statement</button>
            </a>
		</div>
		
		
<div class="form-row">
			<a href="http://localhost/wwwroot/receipt2.php">
                <button class="btn btn-outline-secondary", style = "color: red;"> View receipt</button>
            </a>
		</div>		