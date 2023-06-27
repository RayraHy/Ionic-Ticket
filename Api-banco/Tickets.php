<?php
include_once 'Conexão.php';

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