<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

$nome = $_POST['nome'];
$email = $_POST['email'];
$senha = $_POST['senha'];

$host = "localhost";
$user = "root";
$pass = "34644656";
$dbname = "db_tcc_estacionamento";
$port = 3306;

// Conexão com o banco de dados
$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die("Falha na conexão com o banco de dados: " . $conn->connect_error);
}

// Verifica se o email já está cadastrado
$checkEmailQuery = "SELECT * FROM tb_cliente WHERE cd_email_cliente = '$email'";
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
$insertQuery = "INSERT INTO tb_cliente (cd_email_cliente, cd_senha_cliente, nm_cliente) VALUES ('$email', '$senha', '$nome')";
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
