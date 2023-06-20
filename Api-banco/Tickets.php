<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

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
  $sql = "SELECT * FROM tb_ticket";

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

// Retorna a resposta como JSON
header('Content-Type: application/json');
echo json_encode($response);