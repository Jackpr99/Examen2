

Create Database Examen2
go

CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100),
    CorreoElectronico VARCHAR(100),
    Telefono VARCHAR(15)
);

CREATE TABLE Equipos (
    EquipoID INT IDENTITY(1,1) PRIMARY KEY,
    TipoEquipo VARCHAR(50),
    Modelo VARCHAR(50),
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

CREATE TABLE Reparaciones (
    ReparacionID INT IDENTITY(1,1) PRIMARY KEY,
    EquipoID INT,
    FechaSolicitud DATE,
    Estado VARCHAR(50),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
);

CREATE TABLE DetallesReparacion (
    DetalleID INT IDENTITY(1,1) PRIMARY KEY,
    ReparacionID INT,
    Descripcion TEXT,
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
);

CREATE TABLE Asignaciones (
    AsignacionID INT IDENTITY(1,1) PRIMARY KEY,
    ReparacionID INT,
    TecnicoID INT,
    FechaAsignacion DATE,
    FOREIGN KEY (ReparacionID) REFERENCES Reparaciones(ReparacionID)
);

CREATE TABLE Tecnicos (
    TecnicoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100),
    Especialidad VARCHAR(100)
);
GO

CREATE PROCEDURE CrearUsuario
    @Nombre VARCHAR(100),
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(15)
AS
BEGIN
    INSERT INTO Usuarios (Nombre, CorreoElectronico, Telefono)
    VALUES (@Nombre, @CorreoElectronico, @Telefono);
END;
GO

CREATE PROCEDURE LeerUsuarios
AS
BEGIN
    SELECT * FROM Usuarios;
END;
GO

CREATE PROCEDURE ActualizarUsuario
    @UsuarioID INT,
    @Nombre VARCHAR(100),
    @CorreoElectronico VARCHAR(100),
    @Telefono VARCHAR(15)
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = @Nombre, CorreoElectronico = @CorreoElectronico, Telefono = @Telefono
    WHERE UsuarioID = @UsuarioID;
END;
GO

CREATE PROCEDURE BorrarUsuario
    @UsuarioID INT
AS
BEGIN
    DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID;
END;
GO

CREATE PROCEDURE CrearEquipo
    @TipoEquipo VARCHAR(50),
    @Modelo VARCHAR(50),
    @UsuarioID INT
AS
BEGIN
    INSERT INTO Equipos (TipoEquipo, Modelo, UsuarioID)
    VALUES (@TipoEquipo, @Modelo, @UsuarioID);
END;
GO

CREATE PROCEDURE LeerEquipos
AS
BEGIN
    SELECT * FROM Equipos;
END;
GO

CREATE PROCEDURE ActualizarEquipo
    @EquipoID INT,
    @TipoEquipo VARCHAR(50),
    @Modelo VARCHAR(50),
    @UsuarioID INT
AS
BEGIN
    UPDATE Equipos
    SET TipoEquipo = @TipoEquipo, Modelo = @Modelo, UsuarioID = @UsuarioID
    WHERE EquipoID = @EquipoID;
END;
GO

CREATE PROCEDURE BorrarEquipo
    @EquipoID INT
AS
BEGIN
    DELETE FROM Equipos WHERE EquipoID = @EquipoID;
END;
GO

CREATE PROCEDURE CrearReparacion
    @EquipoID INT,
    @FechaSolicitud DATE,
    @Estado VARCHAR(50)
AS
BEGIN
    INSERT INTO Reparaciones (EquipoID, FechaSolicitud, Estado)
    VALUES (@EquipoID, @FechaSolicitud, @Estado);
END;
GO

CREATE PROCEDURE LeerReparaciones
AS
BEGIN
    SELECT * FROM Reparaciones;
END;
GO

CREATE PROCEDURE ActualizarReparacion
    @ReparacionID INT,
    @EquipoID INT,
    @FechaSolicitud DATE,
    @Estado VARCHAR(50)
AS
BEGIN
    UPDATE Reparaciones
    SET EquipoID = @EquipoID, FechaSolicitud = @FechaSolicitud, Estado = @Estado
    WHERE ReparacionID = @ReparacionID;
END;
GO

CREATE PROCEDURE BorrarReparacion
    @ReparacionID INT
AS
BEGIN
    DELETE FROM Reparaciones WHERE ReparacionID = @ReparacionID;
END;
GO

CREATE PROCEDURE CrearDetalleReparacion
    @ReparacionID INT,
    @Descripcion TEXT,
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    INSERT INTO DetallesReparacion (ReparacionID, Descripcion, FechaInicio, FechaFin)
    VALUES (@ReparacionID, @Descripcion, @FechaInicio, @FechaFin);
END;
GO

CREATE PROCEDURE LeerDetallesReparacion
AS
BEGIN
    SELECT * FROM DetallesReparacion;
END;
GO

CREATE PROCEDURE ActualizarDetalleReparacion
    @DetalleID INT,
    @ReparacionID INT,
    @Descripcion TEXT,
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    UPDATE DetallesReparacion
    SET ReparacionID = @ReparacionID, Descripcion = @Descripcion, FechaInicio = @FechaInicio, FechaFin = @FechaFin
    WHERE DetalleID = @DetalleID;
END;
GO

CREATE PROCEDURE BorrarDetalleReparacion
    @DetalleID INT
AS
BEGIN
    DELETE FROM DetallesReparacion WHERE DetalleID = @DetalleID;
END;
GO

CREATE PROCEDURE CrearAsignacion
    @ReparacionID INT,
    @TecnicoID INT,
    @FechaAsignacion DATE
AS
BEGIN
    INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaAsignacion);
END;
GO

CREATE PROCEDURE LeerAsignaciones
AS
BEGIN
    SELECT * FROM Asignaciones;
END;
GO

CREATE PROCEDURE ActualizarAsignacion
    @AsignacionID INT,
    @ReparacionID INT,
    @TecnicoID INT,
    @FechaAsignacion DATE
AS
BEGIN
    UPDATE Asignaciones
    SET ReparacionID = @ReparacionID, TecnicoID = @TecnicoID, FechaAsignacion = @FechaAsignacion
    WHERE AsignacionID = @AsignacionID;
END;
GO

CREATE PROCEDURE BorrarAsignacion
    @AsignacionID INT
AS
BEGIN
    DELETE FROM Asignaciones WHERE AsignacionID = @AsignacionID;
END;
GO

CREATE PROCEDURE CrearTecnico
    @Nombre VARCHAR(100),
    @Especialidad VARCHAR(100)
AS
BEGIN
    INSERT INTO Tecnicos (Nombre, Especialidad)
    VALUES (@Nombre, @Especialidad);
END;
GO

CREATE PROCEDURE LeerTecnicos
AS
BEGIN
    SELECT * FROM Tecnicos;
END;
GO

CREATE PROCEDURE ActualizarTecnico
    @TecnicoID INT,
    @Nombre VARCHAR(100),
    @Especialidad VARCHAR(100)
AS
BEGIN
    UPDATE Tecnicos
    SET Nombre = @Nombre, Especialidad = @Especialidad
    WHERE TecnicoID = @TecnicoID;
END;
GO

CREATE PROCEDURE BorrarTecnico
    @TecnicoID INT
AS
BEGIN
    DELETE FROM Tecnicos WHERE TecnicoID = @TecnicoID;
END;
GO