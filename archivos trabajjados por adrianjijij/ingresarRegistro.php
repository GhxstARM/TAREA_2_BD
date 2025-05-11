<?php
    require_once 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $email = $_POST['email'];
    $rol_usuario = $_POST['rol_usuario'];

    try {
        $connection = new connection();
        $pdo = $connection->connect();

        // Corregimos la sentencia SQL
        $sql = "INSERT INTO usuarios (email, password, rol_usuario, username) 
                VALUES (:email, :password, :rol_usuario, :username)";
        $stmt = $pdo->prepare($sql);

        // Ejecutamos la sentencia correctamente
        $stmt->execute([
            'username' => $username,
            'password' => $password,
            'email' => $email,
            'rol_usuario' => $rol_usuario,
        ]);

        // Si se registra correctamente, redirigimos al inicio de sesión
        echo "<script>
            alert('Usuario registrado correctamente.');
            window.location.href = 'sesion.php';
        </script>";

    } catch (\Throwable $th) {
        // Capturamos el error y lo mostramos
        echo "<script>
            alert('Error al registrar el usuario: ". addslashes($th->getMessage()) ."');
            window.location.href = '../ingresarRegistro.php';
        </script>";
    }
}
?>

