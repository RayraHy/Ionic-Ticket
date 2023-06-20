<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if (isset($_POST['email']) && isset($_POST['senha'])) {
  $email = $_POST['email'];
  $senha = $_POST['senha'];

  // Configurações do banco de dados
  $host = "localhost";
  $user = "root";
  $pass = "root";
  $dbname = "db_ticket";

  // Conexão com o banco de dados
  $conn = new mysqli($host, $user, $pass, $dbname);
  if ($conn->connect_error) {
    die("Falha na conexão com o banco de dados: " . $conn->connect_error);
  }

  // Consulta SQL para verificar as credenciais de login
  $sql = "SELECT * FROM tb_atendente WHERE cd_email_atendente = '$email' AND cd_senha_atendente = '$senha'";
  $result = $conn->query($sql);

  if ($result->num_rows == 1) {
    // Login bem-sucedido
    $response = [
      'success' => true,
      'message' => 'Login successful',
    ];
  } else {
    // Credenciais inválidas
    $response = [
      'success' => false,
      'message' => 'Email ou senha invalido',
    ];
  }

  // Fecha a conexão com o banco de dados
  $conn->close();
} else {
  // Dados de login ausentes
  $response = [
    'success' => false,
    'message' => 'Precisa do email e senha',
  ];
}

// Retorna a resposta como JSON
header('Content-Type: application/json');
echo json_encode($response);