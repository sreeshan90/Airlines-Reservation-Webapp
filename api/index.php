<?php

require 'Slim/Slim.php';

$app = new Slim();

$app->get('/flights/search/bycode/zero/:departure/:arrival', 'findByCodezero');
$app->get('/flights/search/bycode/one/:departure/:arrival', 'findByCodeone');
$app->get('/flights/search/bycode/two/:departure/:arrival', 'findByCodetwo');
$app->get('/flights/search/bycode/three/:departure/:arrival', 'findByCodethree');

$app->get('/flights/search/seats/:flightNumber/:date', 'findSeats');
$app->get('/flights/search/fare/:flightNumber', 'getFare');
$app->get('/flights/search/passenger/:flightNumber/:date', 'getPassengers');
$app->get('/flights/search/instances/:custName', 'getFlightInstances');
$app->run();


function findByCodezero($departure,$arrival) {

	$sql = "select * from flight where Departure_airport_code = :departure and Arrival_airport_code = :arrival;";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("departure", $departure);
			$stmt->bindParam("arrival", $arrival);
	    $stmt->execute();
		$flights = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo json_encode($flights);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}


function findByCodeone($departure,$arrival) {

	$sql = "select f1.flight_number as firstFlightNumber, f1.departure_airport_code as firstAirport, f2.flight_number as secondFlightNumber, f2.departure_airport_code as middleAirport, f2.arrival_airport_code as lastAirport from

            (select * from flight where departure_airport_code=:departure ) f1,
            (select * from flight where arrival_airport_code = :arrival)  f2

            where f1.arrival_airport_code = f2.departure_airport_code and timediff(f2.Scheduled_departure_time,f1.Scheduled_arrival_time) > '01:00:00'

            and

                ( (f1.Weekdays LIKE '%Sun%' and f2.Weekdays LIKE '%Sun%')or
                ( f1.Weekdays LIKE '%Mon%' and f2.Weekdays LIKE '%Mon%')or
                (f1.Weekdays LIKE '%Tue%' and f2.Weekdays LIKE '%Tue%')or
                (f1.Weekdays LIKE '%Wed%'  and f2.Weekdays LIKE '%Wed%')or
                (f1.Weekdays LIKE '%Thu%' and f2.Weekdays LIKE '%Thu%')or
                (f1.Weekdays LIKE '%Fri%'  and f2.Weekdays LIKE '%Fri%')or
                (f1.Weekdays LIKE '%Sat%' and f2.Weekdays LIKE  '%Sat%'))
            ; ";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("departure", $departure);
			$stmt->bindParam("arrival", $arrival);
	    $stmt->execute();
		$flights = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo json_encode($flights);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}


function findByCodetwo($departure,$arrival) {

	$sql = "select f1.flight_number as firstFlightNumber2, f1.departure_airport_code as firstAirport2, f2.flight_number as secondFlightNumber2, f2.departure_airport_code as secondAirport2, f2.arrival_airport_code as thirdAirport2, f3.flight_number as thirdFlightNumber2, f3.arrival_airport_code as lastAirport2 from
            (select * from flight where departure_airport_code=:departure ) f1
            join
            (select * from flight) f2
            on (f2.departure_airport_code=f1.arrival_airport_code)
            join
            (select * from flight where arrival_airport_code = :arrival)  f3
            on (f2.arrival_airport_code = f3.departure_airport_code)

            where  timediff(f2.Scheduled_departure_time,f1.Scheduled_arrival_time) > '01:00:00'
            and timediff(f3.Scheduled_departure_time,f2.Scheduled_arrival_time) > '01:00:00'

            and ((f1.Weekdays LIKE '%Sun%' and f2.Weekdays LIKE '%Sun%' and f3.Weekdays LIKE '%Sun%' )
                	or( f1.Weekdays LIKE '%Mon%' and f2.Weekdays LIKE '%Mon%' and f3.Weekdays LIKE '%Mon%' )
                	or (f1.Weekdays LIKE '%Tue%' and f2.Weekdays LIKE '%Tue%' and f3.Weekdays LIKE '%Tue%' )
                	or (f1.Weekdays LIKE '%Wed%'  and f2.Weekdays LIKE '%Wed%' and f3.Weekdays LIKE '%Wed%' )or
                	(f1.Weekdays LIKE '%Thu%' and f2.Weekdays LIKE '%Thu%' and f3.Weekdays LIKE '%Thu%')or
                	(f1.Weekdays LIKE '%Fri%' and f2.Weekdays LIKE '%Fri%' and f3.Weekdays LIKE '%Fri%' )or
                	 (f1.Weekdays LIKE '%Sat%' and f2.Weekdays LIKE '%Sat%' and f3.Weekdays LIKE '%Sat%'));  ";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("departure", $departure);
			$stmt->bindParam("arrival", $arrival);
	    $stmt->execute();
		$flights = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo json_encode($flights);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}


function findByCodethree($departure,$arrival) {

	$sql = "select f1.flight_number as firstFlightNumber3, f1.departure_airport_code as firstAirport3, f2.flight_number as secondFlightNumber3, f2.departure_airport_code as secondAirport3, f2.arrival_airport_code as thirdAirport3, f3.flight_number as thirdFlightNumber3, f4.arrival_airport_code as lastAirport3 from
            (select * from flight where departure_airport_code=:departure ) f1
            join
            (select * from flight) f2
            on (f2.departure_airport_code=f1.arrival_airport_code)
            join
            (select * from flight)  f3
            on (f2.arrival_airport_code = f3.departure_airport_code)
            join
            (select * from flight where arrival_airport_code = :arrival)  f4
            on (f3.arrival_airport_code = f4.departure_airport_code)
            where  timediff(f2.Scheduled_departure_time,f1.Scheduled_arrival_time) > '01:00:00'
            and timediff(f3.Scheduled_departure_time,f2.Scheduled_arrival_time) > '01:00:00'
            and timediff(f4.Scheduled_departure_time,f3.Scheduled_arrival_time) > '01:00:00'

            and ((f1.Weekdays LIKE '%Sun%' and f2.Weekdays LIKE '%Sun%' and f3.Weekdays LIKE '%Sun%' and f4.Weekdays LIKE '%Sun%' )
                	or( f1.Weekdays LIKE '%Mon%' and f2.Weekdays LIKE '%Mon%' and f3.Weekdays LIKE '%Mon%' and f4.Weekdays LIKE '%Mon%'  )
                	or (f1.Weekdays LIKE '%Tue%' and f2.Weekdays LIKE '%Tue%' and f3.Weekdays LIKE '%Tue%'  and f4.Weekdays LIKE '%Tue%' )
                	or (f1.Weekdays LIKE '%Wed%'  and f2.Weekdays LIKE '%Wed%' and f3.Weekdays LIKE '%Wed%'  and f4.Weekdays LIKE '%Wed%' )or
                	(f1.Weekdays LIKE '%Thu%' and f2.Weekdays LIKE '%Thu%' and f3.Weekdays LIKE '%Thu%'  and f4.Weekdays LIKE '%Thu%')or
                	(f1.Weekdays LIKE '%Fri%' and f2.Weekdays LIKE '%Fri%' and f3.Weekdays LIKE '%Fri%'  and f4.Weekdays LIKE '%Fri%')or
                	 (f1.Weekdays LIKE '%Sat%' and f2.Weekdays LIKE '%Sat%' and f3.Weekdays LIKE '%Sat%'  and f4.Weekdays LIKE '%Sat%'));  ";

	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("departure", $departure);
			$stmt->bindParam("arrival", $arrival);
	    $stmt->execute();
		$flights = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo json_encode($flights);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}




function findSeats($flightNumber,$date) {

	$sql = "select Number_of_available_seats from flight_instance where  flight_number =  :flightNumber and  _Date = :date;";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("flightNumber", $flightNumber);
			$stmt->bindParam("date", $date);
	    $stmt->execute();
		$flights = $stmt->fetchObject();
		$db = null;
		echo json_encode($flights);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

function getFare($flightNumber) {

	$sql = "select * from fare where  flight_number = :flightNumber;";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("flightNumber", $flightNumber);
	    $stmt->execute();
		$flights = $stmt->fetchObject();
		$db = null;
		echo json_encode($flights);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}


function getPassengers($flightNumber,$date) {

	$sql = "select customer_name from seat_reservation where Flight_number = :flightNumber and _Date = :date;";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("flightNumber", $flightNumber);
		$stmt->bindParam("date", $date);
	    $stmt->execute();
		$flights = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo json_encode($flights);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}


function getFlightInstances($custName) {

	$sql = "select f.flight_number, f._Date, f.arrival_time, f.Departure_time, s.seat_number from flight_instance as f, seat_reservation as s where f.flight_number = s.flight_number and s.customer_name = :custName;";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("custName", $custName);
		$stmt->execute();
		$flights = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo json_encode($flights);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

function getConnection() {
	$dbhost="127.0.0.1";
	$dbuser="root";
	$dbpass="summer15";
	$dbname="airlinereservation";
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	return $dbh;
}

?>