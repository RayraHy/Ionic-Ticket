<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

$host = "localhost";
$user = "root";
$pass = "root";
$dbname = "db_ticket";
$port = 3306;

// Conexão com o banco de dados
$conn = new mysqli($host, $user, $pass, $dbname, $port);

// Verificar a conexão
if ($conn->connect_error) {
    die("Falha na conexão com o banco de dados: " . $conn->connect_error);
}

// Verificar se o ID do ticket foi fornecido via requisição POST
if (isset($_POST['ticket_id'])) {
    $ticketId = $_POST['ticket_id'];

    // Consulta SQL para atualizar o status do ticket
    $sql = "UPDATE tb_ticket SET ds_status_ticket = 'Concluído' WHERE cd_ticket = '$ticketId'";

    // Executar a consulta
    if ($conn->query($sql) === TRUE) {
        // Atualização realizada com sucesso
        echo "Status do ticket atualizado com sucesso.";
    } else {
        // Erro ao executar a consulta
        echo "Erro ao atualizar o status do ticket: " . $conn->error;
    }
} else {
    // ID do ticket não fornecido
    echo "ID do ticket não fornecido.";
}

// Fechar a conexão com o banco de dados
$conn->close();
?>
