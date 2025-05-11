<?php 
include 'conexion.php';
session_start(); 
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Buscador Seguro</title>
</head>
<body>

<form action="" method="get">
	<input type="text" name="busqueda" placeholder="Buscar artículos"><br>
	<input type="submit" name="enviar" value="Buscar">
</form>
<br><br><br>

<?php
if (isset($_GET['enviar']) && $_GET["busqueda"] != '') {
	$busqueda = trim($_GET['busqueda']); // Limpiamos espacios extra

	// Creamos la conexión usando tu clase
	$db = new connection();
	$conn = $db->connect();

	// Consulta segura usando prepared statement
	$sql = "SELECT * FROM articulos WHERE titulo LIKE :busqueda";
	$stmt = $conn->prepare($sql);
	$parametro = "%$busqueda%";
	$stmt->bindParam(':busqueda', $parametro, PDO::PARAM_STR);
	$stmt->execute();

	// Mostrar resultados
	$resultados = $stmt->fetchAll();
	if ($resultados) {
		foreach ($resultados as $row) {
			echo htmlspecialchars($row['titulo']) . '<br>'; // protección XSS
		}
	} else {
		echo "No se encontraron resultados para: <b>" . htmlspecialchars($busqueda) . "</b><br>";
	}
} else {
	echo 'INGRESE DETALLES<br>';
}
?>

<a href="sesion.php">Iniciar sesión</a>
</body>
</html>
