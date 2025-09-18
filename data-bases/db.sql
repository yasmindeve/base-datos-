CREATE DATABASE dapiato IF NOT EXISTS;

USE dapiato;

CREATE TABLE pacientes (
    id VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    doctor VARCHAR(255) NOT NULL,
    caso_especial VARCHAR(50),
    fecha_registro TIMESTAMP WITH TIME ZONE NOT NULL,
    fecha_atencion TIMESTAMP WITH TIME ZONE
);

INSERT INTO pacientes 
(
    id, 
    nombre, 
    doctor, 
    caso_especial, 
    fecha_registro, 
    fecha_atencion
    ) 
VALUES
(
    'TICKET-0004', 
    'Maria Lopez', 
    'Dr. Gomez', 
    'anciano', 
    '2025-09-16 12:30:00 PM +00', 
    NULL
    )
;

SELECT * FROM pacientes;

SELECT * FROM pacientes WHERE id = 'TICKET-0001';

SELECT * FROM pacientes WHERE caso_especial = 'anciano';

UPDATE pacientes SET fecha_atencion = '2025-09-16 12:45:00 PM +00' WHERE id = 'TICKET-0004';

UPDATE pacientes SET doctor = 'Dra. Ana', fecha_atencion = '2025-09-16 12:48:00 PM +00' WHERE id = 'TICKET-0004';

DELETE FROM pacientes WHERE id = 'TICKET-0002';