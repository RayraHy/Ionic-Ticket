<?php
include_once 'Conexão.php';

if (isset($_POST['email']) && isset($_POST['senha'])) {
  $email = $_POST['email'];
  $senha = $_POST['senha'];

  // Consulta SQL para verificar as credenciais de login
  $sql = "SELECT * FROM tb_integrantes WHERE cd_email_integrante = '$email' AND cd_senha_integrante = '$senha'";
  $result = $conn->query($sql);

  if ($result->num_rows == 1) {
    // Login bem-sucedido
    $cliente = $result->fetch_assoc();
    $response = [
      'success' => true,
      'message' => 'Login successful',
      'cd_integrantes' => $cliente['cd_integrantes']
    ];
  } else {
    // Credenciais inválidas
    $response = [
      'success' => false,
      'message' => 'Email ou senha invalido',
      'cd_integrantes' => null
    ];
  }

  // Fecha a conexão com o banco de dados
  $conn->close();
} else {
  // Dados de login ausentes
  $response = [
    'success' => false,
    'message' => 'Precisa do email e senha',
    'cd_integrantes' => null
  ];
}

// Retorna a resposta como JSON
header('Content-Type: application/json');
echo json_encode($response);