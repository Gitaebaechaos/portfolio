<?php


include('../wwwroot/htmlpage.html');
$name = '';
$date = '';
$hour = '';

if(isset($_POST['name'])){ $name = $_POST['name']; }
if(isset($_POST['date'])){ $date = $_POST['date']; }
if(isset($_POST['hour'])){ $hour = $_POST['hour']; }


$result = mysql_query("SELECT * FROM register WHERE name = '".mysql_real_escape_string($name)."')");
if(!$result)
{
die(mysql_error());
}


if(mysql_num_rows($result) > 0)
{
die('<p>This date and time have already been booked. <a href="http://localhost/wwwroot/htmlpage.html">Please try another time</a>.</p>');
}
else
{
//insert new user data into Users table
$sql = "INSERT INTO `register` ( `name`, `date` ,  `hour`) VALUES(  '{$name}', '{$date}' ,  '{$hour}' ";
mysql_query($sql) or die(mysql_error());
echo "<a href='http://localhost/wwwroot/form.php'> Send reminder text </a>";
}


 ?>