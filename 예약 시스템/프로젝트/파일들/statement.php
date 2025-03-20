<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body style="margin: 50px;">
    <h1>Statement of Reservation</h1>
    <br>
    <table class="table">
        <thead>
			<tr>
				<th>date</th>
				<th>hour</th>
				<th>name</th>
				<th>phone</th>
				<th>howManyPerson</th>
				<th>email</th>
			</tr>
		</thead>

        <tbody>
            <?php
            $servername = "localhost";
			$username = "root";
			$password = "";
			$database = "restaurant";

			// Create connection
			$connection = new mysqli($servername, $username, $password, $database);

            // Check connection
			if ($connection->connect_error) {
				die("Connection failed: " . $connection->connect_error);
			}

            // read all row from database table
			$sql = "SELECT * FROM register ORDER BY ID DESC LIMIT 1";
			$result = $connection->query($sql);

			if (!$result) {
				die("Invalid query: " . $connection->error);
			}

			//read data of each row
			while($row = $result->fetch_assoc()){
				echo "<tr>
					<td>" . $row["date"] . "</td>
					<td>" . $row["hour"] . "</td>
					<td>" . $row["name"] . "</td>
					<td>" . $row["phone"] . "</td>
					<td>" . $row["howManyPerson"] . "</td>
					<td>" . $row["email"] . "</td>
				</tr>";
			}

            $connection->close();
            ?>
        </tbody>
    </table>
</body>

<div class="nav">
                    <ul>
                        <a href="http://localhost/wwwroot/product/index.html"> 
						<button class="w3-bar-item w3-button", style = "color: blue";>Back Homepage</button>
						</a>
                        <!-- <li><a href="#">Menue</a></li>
                        <li><a href="#">Adrress</a></li>
                        <li><a href="#">banquet foods</a></li>
                        <li><a href="#">Sttings</a></li> -->
                    </ul> 
                </div>
</html>