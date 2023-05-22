-- Transação iniciada, mas não concluída devido a uma falha
START TRANSACTION;
INSERT INTO Pedidos (id, cliente_id, data_pedido, status) VALUES (2, 2, '2023-05-16', 'Em Processamento');
