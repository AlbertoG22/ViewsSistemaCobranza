DROP DATABASE sistema_cobranza_db;
CREATE DATABASE IF NOT EXISTS sistema_cobranza_db;

USE sistema_cobranza_db;

CREATE TABLE IF NOT EXISTS propietario(
    idPropietario INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Usuario VARCHAR(50) NOT NULL,
    Contraseña VARCHAR(15) NOT NULL,
    Correo VARCHAR(30) NOT NULL,
    Teléfono INT(10) NOT NULL
);
CREATE TABLE IF NOT EXISTS deudor(
    idDeudor INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Teléfono VARCHAR(13) NOT NULL,
    Correo VARCHAR(30) NOT NULL,
    Contraseña VARCHAR(15) NOT NULL,
    Deuda_total DECIMAL(19,4) 
);
CREATE TABLE IF NOT EXISTS deudas(
    idDeudas INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (idDeudor) REFERENCES deudor(idDeudor),
    Fecha DATETIME NOT NULL,
    Concepto VARCHAR(80) NOT NULL,
    Monto DECIMAL(19,4) NOT NULL
);
CREATE TABLE IF NOT EXISTS pagos(
    idPagos INT(50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (idDeudor) REFERENCES deudor(idDeudor),
    Fecha DATETIME NOT NULL,
    Monto DECIMAL(19,4) NOT NULL,
    FOREIGN KEY (id) REFERENCES deudas(id)
);

drop trigger ActualizarMonto
DELIMITER && 
CREATE TRIGGER ActualizarMonto AFTER INSERT ON deudas FOR EACH ROW
BEGIN 
    UPDATE deudor SET deudor.Deuda_total = deudor.Deuda_total + NEW.Monto WHERE deudor.idDeudor = NEW.idDeudor;

END &&
DELIMITER ;


INSERT INTO `deudor`(`Nombre`, `Teléfono`, `Correo`, `Contraseña`, `Deuda_total`) 
VALUES ("Pillo Torres", "3123154879", "pillo_puto@ucol.mx", "soygay", 0);

SELECT * FROM deudor;

INSERT INTO `deudas`(`idDeudas`, `Fecha`,`Concepto`,`Monto`)
VALUES (1, now(), "televisión", 5000), (1, now(), "lavadora", 25000);









--esta sentencia es para borrar una base de datos y hacerla de nuevo
DROP DATABASE sistema_cobranza_db;

CREATE DATABASE IF NOT EXISTS sistema_cobranza_db;

USE sistema_cobranza_db;

CREATE TABLE IF NOT EXISTS propietario(
    idPropietario INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Usuario VARCHAR(50) NOT NULL,
    Contraseña VARCHAR(15) NOT NULL,
    Correo VARCHAR(30) NOT NULL,
    Teléfono INT(10) NOT NULL
);
CREATE TABLE IF NOT EXISTS deudor(
    idDeudor INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Teléfono VARCHAR(13) NOT NULL,
    Correo VARCHAR(30) NOT NULL,
    Contraseña VARCHAR(15) NOT NULL,
    Deuda_total DECIMAL(19,4) 
);
CREATE TABLE IF NOT EXISTS deudas(
    idDeudas INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idDeudor int(11) NOT NULL,
    FOREIGN KEY (idDeudor) REFERENCES deudor(idDeudor),
    Fecha DATETIME NOT NULL,
    Concepto VARCHAR(80) NOT NULL,
    Monto DECIMAL(19,4) NOT NULL
);
CREATE TABLE IF NOT EXISTS pagos(
    idPagos INT(50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idDeudas int(50) not null,
    idDeudor int(50) not null,
    FOREIGN KEY (idDeudor) REFERENCES deudor(idDeudor),
    Fecha DATETIME NOT NULL,
    Monto DECIMAL(19,4) NOT NULL,
    FOREIGN KEY (idDeudas) REFERENCES deudas(idDeudas)
);

--esta sentencia es para eliminar y volver a crear el trigger, no se necesita cuando se va creando el trigger
drop trigger ActualizarMonto;
DELIMITER && 
CREATE TRIGGER ActualizarMonto AFTER INSERT ON deudas FOR EACH ROW
BEGIN 
    UPDATE deudor SET deudor.Deuda_total = deudor.Deuda_total + NEW.Monto WHERE deudor.idDeudor = NEW.idDeudor;

END &&
DELIMITER ;

INSERT INTO `deudor`(`Nombre`, `Teléfono`, `Correo`, `Contraseña`, `Deuda_total`) 
VALUES ("Pillo Torres", "3123154879", "pillo_puto@ucol.mx", "soygay", 0);


SELECT * FROM deudor;

INSERT INTO `deudas`(`idDeudor`, `Fecha`,`Concepto`,`Monto`)
VALUES (1, now(), "televisión", 5000), (1, now(), "lavadora", 25000);

