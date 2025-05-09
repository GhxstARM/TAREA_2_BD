<?php

session_start();
$login= 'Adrian';

$_SESSION['admin'] = $login;

if( isset($_SESSION['admin'])){
    header('location:index.php');
}