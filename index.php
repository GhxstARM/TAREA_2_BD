<?php session_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=
	, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
<a href="sesion.php">iniciar sesion</a>
<a href="protegido.php">contenido protegido</a>
<h1>BIENVENIDO: <?php echo isset($_SESSION['admin']) ? $_SESSION['admin']: 'invitado' ?></h1>
	
</body>
</html>