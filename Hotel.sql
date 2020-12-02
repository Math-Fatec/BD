CREATE DATABASE Hotel
GO

CREATE TABLE Mapa_reservas(
 idQuarto INT IDENTITY NOT NULL,
 Status_quarto VARCHAR(10),
 Qtd_quartos INT,
 Reserva_quarto VARCHAR(11),
 PRIMARY KEY (idQuarto)
)
SELECT ROUND(DBMS_RANDOM.VALUE) FROM idQuarto;
EXECUTE DMBS_RANDOM.VALUE;
 INSERT INTO Mapa_reservas (Status_quarto) VALUES
('Aberto'),
('Fechado'),
('Ocupado')
 INSERT INTO Mapa_reservas (Qtd_quartos) VALUES
(1), (2), (3)
 INSERT INTO Mapa_reservas (Reserva) VALUES
('Ocupado'),
('Reservado'),
('Pré-reserva'),
('Reservar')

CREATE TABLE Acomodação(
 Status VARCHAR(100),
 Reserva VARCHAR(11),
 PRIMARY KEY (Reserva, Status),
 FOREIGN KEY (Reserva) REFERENCES Mapa_reservas(Reserva_quarto)
 id_Quarto INT,
 FOREIGN KEY (id_Quarto) REFERENCES Mapa_reservas(idQuarto)
)
 INSERTO INTO Acomodação (Status) VALUES
('Aberto para reserva, pré-reserva'),
('Fechado para limpeza, manut., final'),
('Ocupado, reservado')
 --Begin
IF (Reserva)
 BEGIN
  SELECT Status FROM Acomodação WHERE Status LIKE "Aberto%"
   PRINT 'Reserva liberada'
 END
ELSE
 BEGIN
  SELECT Status FROM Acomodação WHERE Status LIKE "Fechado%" OR LIKE "Ocupado%"
   PRINT 'Aguardando para fazer Reserva ou esperar'
 END

CREATE TABLE Controle(
 iDQuarto INT,
 Data_entrada DATETIME,
 Data_saída DATETIME,
 idCliente INT,
 Reserva_info VARCHAR(50),
 PRIMARY KEY (Reserva_info),
 FOREIGN KEY (Reserva_info) REFERENCES Mapa_reservas(Reserva_quarto),
)
 --Tratamento
SELECT ROUND(DBMS_RANDOM.VALUE) FROM idCliente;
EXECUTE DMBS_RANDOM.VALUE;
 --Relatório
SELECT idQuarto, Data_entrada, Data_saída, id_Cliente, Reserva_info
FROM Controle
ORDER BY Reserva_info, idQuarto, Data_entrada, id_Cliente, Data_saída ASC

CREATE TABLE Formulário(
 Reserva_form VARCHAR(11),
 PRIMARY KEY (Reserva_form, idCliente, idQuarto),
 FOREIGN KEY (Reserva_form) REFERENCES Mapa_reservas(Reserva_quarto),
 Check_in VARCHAR(10),
 Check_in_time DATETIME
 id_Cliente INT,
 Telefone VARCHAR(14),
 Pagamento_day VARCHAR(MAX),
 Codigo INT,
 Qtd INT,
 FOREIGN KEY (id_Cliente) REFERENCES Controle(idCliente),
 FOREIGN KEY (Codigo) REFERENCES Mapa_reservas(idQuarto),
 FOREGIN KEY (Qtd) REFERENCES Mapa_reservas(Qtd_quartos),
 Nome_Cliente VARCHAR(50)
)
SELECT ROUND(DBMS_RANDOM.VALUE) FROM id_Cliente;
EXECUTE DMBS_RANDOM.VALUE;
 --Cliente verificou no site para dps fzr check-in, pessoalmente é diferente
 INSERT INTO Formulário (Check_in) VALUES
('Feito'),
('Ainda não')
SELECT Reserva_form, Check_in, Check_in_time, idCliente, Telefone, Pagamento_day, Codigo, Qtd_quartos, Nome_Cliente
FROM Formulário
ORDER BY Reserva_form, Check_in, Check_in_time, idCliente, Telefone, Pagamento_day, Codigo, Qtd_quartos, Nome_Cliente ASC
IF (Check_in = 'Feito')
 BEGIN
  SELECT Check_in FROM Formulário WHERE Check_in_time
   PRINT 'Check-in finalizado...
           Bem-vindo ao Hotel'
 END
ELSE
   PRINT 'Fazendo Reserva...'

CREATE TABLE Promoções(
 Ofertas VARCHAR(100)
)

SELECT DISTINCT m.Reserva_quarto, a.Reserva, c.Reserva_info, f.Reserva_form
FROM Mapa_reservas AS m
INNER JOIN Acomodação AS a
ON m.Reserva_quarto = a.Reserva
INNER JOIN Controle AS c
ON m.Reserva_Quarto = c.Reserva_info
INNER JOIN Formulário AS f
ON m.Reserva_quarto = f.Rserva_form
ORDER BY m.Reserva_quarto ASC
GO

SELECT DISTINCT m.Status_quarto, a.Status
FROM Mapa_reservas AS m
INNER JOIN Acomodação AS a
ON m.Status_quarto = a.Status
ORDER BY m.Status_quarto ASC
GO

SELECT DISTINCT m.idQuarto, a.id_Quarto, c.iDQuarto, f.Codigo
FROM Mapa_reservas AS m
INNER JOIN Acomodação AS a
ON m.idQuarto = a.id_Quarto
INNER JOIN Controle AS c
ON m.idQuarto = c.iDQuarto
INNER JOIN Formulário AS f
ON m.idQuarto = f.Codigo
ORDER BY m.idQuarto ASC
GO

SELECT c.idCliente, f.id_Cliente
FROM Controle AS c
INNER JOIN Formulário AS f
ON c.idCliente = f.id_Cliente
ORDER BY c.idCliente ASC
GO

SELECT m.Qtd_quartos, f.Qtd
FROM Mapa_reservas AS m
INNER JOIN Formulário AS f
ON m.Qtd_quartos = f.Qtd
ORDER BY m.Qtd_quartos ASC
GO

SELECT Nome_Cliente, idCliente
FROM Formulário
 CROSS JOIN Controle
ORDER BY idCliente ASC
GO