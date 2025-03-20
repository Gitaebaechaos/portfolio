<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<body>
        <section class="container">
            <div class="header">
                <h1>BAMBOO LEAF</h1> 
            </div>
	</body>
	<style>
	thead,
tfoot {
    background-color: #3f87a6;
    color: #fff;
}

tbody {
    background-color: #e4f0f5;
}

caption {
    padding: 10px;
    caption-side: bottom;
}

table {
    border-collapse: collapse;
    border: 2px solid rgb(200, 200, 200);
    letter-spacing: 1px;
    font-family: sans-serif;
    font-size: .8rem;
}

td,
th {
    border: 1px solid rgb(190, 190, 190);
    padding: 5px 10px;
}

td {
    text-align: center;
}
</style>

</head>
<body style="margin: 50px;">
    <h1>Thanks for your booking</h1>
	<h2 style="color: blue">Your Booking Confirmation:<code></code></h2>
    <br>
	
	<!-- <p> Date: </p> -->
	<!-- <p>	Hour: </p>		 -->
	<!-- <p>	Name: </p> -->
	<!-- <p>	Phone: </p> -->
	<!-- <p>	Number of Guests: </p> -->
	<!-- <p>	Email: </p> -->

    <!-- <table class="table"> -->
        <!-- <thead> -->
			<!-- <tr> -->
				<!-- <th>id</th> -->
				<!-- <th>date</th> -->
				<!-- <th>hour</th> -->
				<!-- <th>name</th> -->
				<!-- <th>phone</th> -->
				<!-- <th>howManyPerson</th> -->
				<!-- <th>email</th> -->
			<!-- </tr> -->
		<!-- </thead> -->
		
		<table  class="table">
    <caption>Booking Confirmation </caption>
    <thead>
        <tr>
            <th scope="col">Information</th>
		</tr>
	</thead>
	<tbody>
            <!-- <th scope="col">Info</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">Date</th>
        </tr>
        <tr>
            <th scope="row">Hour</th>
        </tr>
		<tr>
            <th scope="row">Name</th>
        </tr>
		<tr>
            <th scope="row">Phone</th>
        </tr>
		<tr>
            <th scope="row">Number of Guests</th>
        </tr>
		<tr>
            <th scope="row">Email</th>
        </tr> -->

	
		

        
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
					<td><b>" . $row["date"] . "</b></td>
					</tr>
					<tr>
					<td><b>" . $row["hour"] . "</b></td>
					</tr>
					<tr>
					<td><b>" . $row["name"] . "</b></td>
					</tr>
					<tr>
					<td><b>" . $row["phone"] . "</b></td>
					</tr>
					<tr>
					<td><b>" . $row["howManyPerson"] . "</b></td>
					</tr>
					<tr>
					<td><b>" . $row["email"] . "</b></td>
				</tr>";
			}

            $connection->close();
            ?>
        </tbody>
    </table>
</body>
<p><b>
Thank you for your reservation at BambooLeaf
</b></p>
<p><b>
We are delighted to confirm your booking
</b></p>
<p>
To take this booking we require a credit card pre-authorisation. Nothing will be debited from your card when making the booking, however, if you cancel within 24 hours of your booking or don't show up, a cancellation fee per person will be taken as specified.
</p>
<p>
Your table is available for 90 minutes and will be held open for 15 minutes after your reservation time. Please advise us if you will be late, if not we will cancel without notice.
</p>
<p>
Should you wish to make any changes to your booking, or to cancel it please click here.
</p>
<p>
We look forward to seeing you. Thanks!
</p>
<p><b>
Bambooleaf
</b></p>
<p><b>
25 Gouger Street
</b></p>
<p><b>
Adelaide, SA
</b></p>
<p><b>
Phone : 0400-000-000
</b></p>
<p><b>
Email : bambooLeafADL@gmail.com
</b></p>
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

