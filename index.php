<?php
echo 'root holeradio!!!';


$host = 'mariadb';
$db   = 'eventmanager_qual';
$user = 'root';
$pass = 'ykkCVeFjMkgfNegR';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
	PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
	PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
	PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
	$pdo = new PDO($dsn, $user, $pass, $options);
	echo 'super duper';
} catch (Throwable $e) {
	echo '<pre> ' . get_class($e) . '</pre>';
	echo '<pre> ' . $e->getMessage() . '</pre>';
	echo '<pre> ' . $e->getTraceAsString() . '</pre>';
}