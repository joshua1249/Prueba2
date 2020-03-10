<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="estilos">
    <title>Info Sent!</title>
</head>
    <body>
    
        <?php 
$myemail = 'joshua1249@icloud.com';
$name = $_POST['nombre'];
$email = $_POST['email'];
$message = $_POST['mensaje'];

$to = $myemail;
$email_subject = "Nuevo mensaje: $subject";
$email_body = "Haz recibido un nuevo mensaje. \n Nombre: $name \n Correo: $email \n Mensaje: \n $message";
$headers = "From: $email";

mail($to, $email_subject, $email_body, $headers);
echo "El mensaje se ha enviado correctamente";
?>
        <center>
        <h1>Contact</h1>
        <form method="post" action="enviar.php">
            <input type="text" name="nombre" placeholder="NAME">
            <input type="email" name="email" placeholder="EMAIL">
            <br>
            <textarea type="text" name="mensaje" placeholder="MESSAGE"></textarea>
            <br>
            <input type="submit" value="SEND">
        </form>
        </center>
    </body>
</html>