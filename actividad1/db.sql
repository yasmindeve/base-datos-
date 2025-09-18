CREATE TABLE Usuarios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    FechaNacimiento DATE,
    Activo BOOLEAN DEFAULT TRUE
);

INSERT INTO Usuarios (Nombre, Email, FechaNacimiento)
VALUES ('Ana Gómez', 'ana.gomez@ejemplo.com', '1990-05-15');

INSERT INTO Usuarios (Nombre, Email)
VALUES ('Luis Martínez', 'luis.martinez@ejemplo.com');

SELECT * FROM Usuarios;

SELECT Nombre, Email FROM Usuarios;

SELECT * FROM Usuarios WHERE ID = 1;

SELECT * FROM Usuarios WHERE Nombre LIKE 'Luis%';

UPDATE Usuarios
SET Email = 'luis.m@ejemplo.com', Activo = FALSE
WHERE ID = 2;

DELETE FROM Usuarios
WHERE ID = 1;

DROP TABLE Usuarios;