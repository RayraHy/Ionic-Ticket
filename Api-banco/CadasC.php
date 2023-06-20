<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");


$email = $_POST['email'];
$senha = $_POST['senha'];

$host = "localhost";
$user = "root";
$pass = "root";
$dbname = "db_ticket";
$port = 3306;

// Conexão com o banco de dados
$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die("Falha na conexão com o banco de dados: " . $conn->connect_error);
}

// Verifica se o email já está cadastrado
$checkEmailQuery = "SELECT * FROM tb_login WHERE cd_email_login = '$email'";
$result = $conn->query($checkEmailQuery);
if ($result->num_rows > 0) {
    $response = array(
        'status' => 'error',
        'message' => 'Email ja cadastrado'
    );
    echo json_encode($response);
    $conn->close();
    return;
}

// Insere o novo usuário no banco de dados
$insertQuery = "INSERT INTO tb_login (cd_email_login, cd_senha_login) VALUES ('$email', '$senha', )";
if ($conn->query($insertQuery) === TRUE) {
    $response = array(
        'status' => 'success',
        'message' => 'Cadastro realizado com sucesso'
    );
} else {
    $response = array(
        'status' => 'error',
        'message' => 'Erro ao cadastrar: ' . $conn->error
    );
}

// Retorna a resposta como JSON
echo json_encode($response);

// Fecha a conexão com o banco de dados
$conn->close();
