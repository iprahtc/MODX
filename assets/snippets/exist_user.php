<?php
if($_SERVER['REQUEST_METHOD'] == 'POST')
	{
		//Подключение к базе данных
		function connect_db() {
			$HOST = '91.231.84.104';
			$USER = 'ibase_woch';
			$PASSWORD = '512D43hHEJIGBfK';
			$NAME_DB = 'ibase_woch';
			$CHARSET = 'utf8';

			$dsn = "mysql:host=$HOST;dbname=$NAME_DB;charset=$CHARSET";
			$opt = [
				PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
				PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
				PDO::ATTR_EMULATE_PREPARES   => false,
			];

			try {
				$pdo = new PDO($dsn, $USER, $PASSWORD, $opt);
				return $pdo;
			}

			catch(PDOException $e){
				return 0;
			}
		}

		$pdo = connect_db();
	
		if(isset($_POST['email'])) {

			$sql = "SELECT uatr.email FROM modx_web_user_attributes uatr WHERE uatr.email = ?";
			$stmt = $pdo->prepare($sql);
			$stmt->execute(array($_POST['email']));
			$row = $stmt->fetch(PDO::FETCH_LAZY);

			if(empty($_POST['email']) || empty($row['email']))
				echo "yes";
			else
				echo "no";
		}
		elseif(isset($_POST['username'])) {
			
				$sql = "SELECT mwu.username FROM modx_web_users mwu WHERE mwu.username = ?";
			$stmt = $pdo->prepare($sql);
			$stmt->execute(array($_POST['username']));
			$row = $stmt->fetch(PDO::FETCH_LAZY);

			if(empty($_POST['username']) || empty($row['username']))
				echo "yes";
			else
				echo "no";
		}
	}
