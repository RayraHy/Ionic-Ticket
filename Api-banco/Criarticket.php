<?php
include_once 'Conexão.php';

$cliente = $_POST['cliente'];
$ds = $_POST['ds'];
$data = $_POST['data'];
$grav = $_POST['grav'];
$status = $_POST['ds_status'];

$insertQuery = "INSERT INTO tb_ticket (ds_descricao_ticket, dt_data_inicio, cd_integrantes, ds_gravidade_ticket, ds_status_ticket) VALUES ('$ds','$data','$cliente','$grav','$status')";
if ($conn->query($insertQuery) === TRUE) {
    $response = array(
        'status' => 'success',
        'message' => 'Reserva realizada com sucesso'
    );
} else {
    $response = array(
        'status' => 'error',
        'message' => 'Erro ao cadastrar: ' . $conn->error
    );
}
header('Content-Type: application/json');

// Retorna a resposta como JSON
echo json_encode($response);

// Fecha a conexão com o banco de dados
$conn->close();