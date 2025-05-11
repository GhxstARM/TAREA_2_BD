<?php
    require_once 'conexion.php';
    session_start();


if ($_SERVER['REQUEST_METHOD'] == 'POST'){

    $username = $_POST['username'];
    $password = $_POST['password'];

    try {
        $connection = new connection();
        $pdo = $connection->connect();

        $sql = "SELECT * FROM usuarios WHERE username = :username";
        $stmt = $pdo->prepare($sql);
        $stmt-> execute(['username' => $username]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if($user && password_verify($password,$user['password'])){  
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $user['username'];

            $_SESSION['rol_usuario'] = $user['rol_usuario'];

            if($user['rol_usuario'] == 'Autor'){
                header('Location: dashboardAutor.php');
            }elseif($user['Rol_usuario'] == 'Revisor'){
                header('Location: dashboardRevisor.php');
            }elseif($user['rol_usuario'] == 'Jefe'){
                header('Location: dashboardJefe.php');
            }elseif($user['rol_usuario'] == 'Autor_revisor'){
                header('Location:dashboardAmbos.php');
            }else{
                echo 'Acceso Denegado';
            }
            exit();
        }else{
            echo "<script>
                alert('Usuario o contraseña incorrectos');
                window.location.href = 'sesion.php';
            </script>";
        }

    } catch (\Throwable $th){
        $error_message = 'Error en la conexion' . $th->getMessage();
        exit; 
    }
}