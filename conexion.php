<?php 
$link = 'mysql:host=localhost;dbname=gescon';
$usuario = 'root';
$pass= '';
try{
    $pdo = new PDO($link,$usuario,$pass);

    echo 'CONECTADO';

}catch (PDOException $e) {
    print "¡Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>