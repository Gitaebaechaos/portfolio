<?php 
	if (isset($_GET['edit'])) {
		$id = $_GET['edit'];
		$update = true;
		$record = mysqli_query($db, "SELECT * FROM register WHERE id=$id");

		if (count($record) == 1 ) {
			$n = mysqli_fetch_array($record);
			$name = $n['name'];
			$hour = $n['hour'];
			$date = $n['date'];
			$phone = $n['phone'];
			$howManyPerson = $n['howManyPerson'];
			$email = $n['email'];
		}
	}
	if (isset($_POST['update'])) {
	$id = $_POST['id'];
	$date = filter_input(INPUT_POST, 'date');
	$hour = filter_input(INPUT_POST, "hour");
	$name = filter_input(INPUT_POST, 'name');
	$phone = filter_input(INPUT_POST, 'phone');
	$howManyPerson = filter_input(INPUT_POST, "howManyPerson", FILTER_VALIDATE_INT);
	$email = filter_input(INPUT_POST, "email", FILTER_VALIDATE_EMAIL);

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

	mysqli_query($db, "UPDATE register SET name='$name', hour='$hour', date='$date', phone='$phone', howManyPerson='$howManyPerson', email='$email' WHERE id=$id");
	$_SESSION['message'] = "Information updated!"; 
	header('location: database.php');
	exit;
}
?> 
<!DOCTYPE html>
<html>



<body>

    <section class="banner">
        <h2>BOOK YOUR TABLE NOW</h2>
        <div class="card-container">
            <div class="card-img">
                <!-- image here -->
            </div>

            <div class="card-content">
                <h3>Reservation</h3>
               
                    <div class="form-row">
						<input type = "date", name = "date", placeholder = "Date", value="<?php echo $date; ?>">
                        <!-- <select name="day"> -->
                            <!-- <option value="day-select">Select Day</option> -->
                            <!-- <option value="sunday">Sunday </option> -->
                            <!-- <option value="monday">Monday </option> -->
                            <!-- <option value="tuesday">Tuesday </option> -->
                            <!-- <option value="wednesday">Wednesday </option> -->
                            <!-- <option value="thursday">Thursday </option> -->
                            <!-- <option value="friday">Friday </option> -->
                            <!-- <option value="saturday">Saturday </option>s -->
                        <!-- </select> -->

                        <input type = "text", name="email", placeholder="Email", value="<?php echo $email; ?>">
						
						<!-- <input list = "hour", name = "hour", placeholder="Select Hour"> -->
						<!-- <datalist id = "hour"> -->
						<select name = "hour", value="<?php echo $hour; ?>">
                            <option value="hour-select">Select Hour</option>
                            <option value="05: 00 PM - 07: 00 PM">05: 00 PM - 07: 00 PM</option>
                            <option value="07: 00 PM - 09: 00 PM">07: 00 PM - 09: 00 PM</option>
                            <option value="09: 00 PM - 11: 00 PM">09: 00 PM - 11: 00 PM</option>
                            <!--<option value="10">16: 00 </option>
                            <option value="10">18: 00 </option>
                            <option value="10">20: 00 </option>
                            <option value="10">22: 00 </option>-->
                        </select>
						<!-- </datalist> -->
                    </div>

                    <div class="form-row">
                        <input type="text", name="name", placeholder="Full Name", value="<?php echo $name; ?>">
                        <input type="text", name="phone", placeholder="Phone Number", value="<?php echo $phone; ?>">
                    </div>

                    <div class="form-row">
                        <input type="number", name="howManyPerson", placeholder="How Many Persons?" min="1", value="<?php echo $howManyPerson; ?>">
                        <button class="btn" type="submit" name="save" href="/wwwroot/database.php" >Save</button>
                    </div>
                </form>
            </div>
        </div>
    </section>

</body>
</html>

