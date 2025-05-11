<?php
session_start();

if( isset($_SESSION['admin']) ){
    echo 'BIENVENIDO'.$_SESSION['admin'];
    echo '<br><a href="cerrar.php">cerrar sesion</a>';
}else{
    header('location:index.php');
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1> HOLA PERKIN HTML</h1>
</body>
</html>