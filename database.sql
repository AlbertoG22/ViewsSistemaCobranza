CREATE DATABASE IF NOT EXISTS sistema_cobranza;

USE sistema_cobranza;

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