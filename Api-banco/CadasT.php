<?php
include_once 'Conexão.php';

$nome = $_POST['nome'];
$email = $_POST['email'];
$senha = $_POST['senha'];
$cpf = $_POST['cpf'];

// Verifica se o email já está cadastrado
$checkEmailQuery = "SELECT * FROM tb_atendente WHERE cd_email_atendente = '$email'";
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
$insertQuery = "INSERT INTO tb_atendente (cd_email_atendente, cd_senha_atendente, cd_cpf, nm_atendente) VALUES ('$email', '$senha', '$cpf', '$nome')";
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
