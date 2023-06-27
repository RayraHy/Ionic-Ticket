<?php
include_once 'Conexão.php';

$ds = $_POST[''];


$insertQuery = "INSERT INTO tb_ticket (cd_ticket, ds_descricao_ticket, dt_data_inicio, dt_data_fim, hr_data_inicio, cd_atendente, cd_integrantes, ds_gravidade_ticket, ds_status_ticket) VALUES ('$cdcliente','$esta','$data','$hora','$status','$taxa','$veicu')";
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