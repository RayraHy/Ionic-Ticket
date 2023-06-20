<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");



$host = "localhost";
$user = "root";
$pass = "root";
$dbname = "db_ticket";
$port = 3306;

    //Conexão com a porta
    $conn = new mysqli($host, $user, $pass, $dbname, );
    //Conexão sem a porta
    // Verificar a conexão
    if ($conn->connect_error) {
        die("Falha na conexão com o banco de dados: " . $conn->connect_error);
    }

    // Consulta para recuperar os dados do banco de dados
    $sql = "SELECT * FROM tb_ticket";
    $result = $conn->query($sql);

    // Verificar se há resultados
    if ($result->num_rows > 0) {
        $dados = array();

        // Converter os resultados em um array associativo
        while ($row = $result->fetch_assoc()) {
            $dados[] = $row;
        }

        // Definir cabeçalho como JSON
        header('Content-Type: application/json');

        // Enviar os dados em formato JSON para o Ionic
        echo json_encode($dados);
    } else {
        echo "Nenhum resultado encontrado.";
    }

    // Fechar a conexão com o banco de dados
    $conn->close();
    ?>