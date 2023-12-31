CREATE TABLE TRAFIMARHistSaldosCx(
    ID			INT IDENTITY(1,1)	  NOT NULL,
    IDOrigen		INT,
    FechaEmision	DATETIME,
    Mov			VARCHAR(30),
    MovID			VARCHAR(20),
    Cliente		VARCHAR(20),
    Nombre		VARCHAR(150),
    Moneda		VARCHAR(10),
    SubTotal        FLOAT,
    Impuestos		FLOAT,
    Total           FLOAT,
    TipoCambio      FLOAT,
    SubTotalMN      FLOAT,
    ImpuestosMN     FLOAT,
    TotalMN         FLOAT,
    Saldo           FLOAT,
    Aplicacion      FLOAT,
    Descripcion     VARCHAR(255),
    Concepto        VARCHAR(100),
    Sucursal        INT,
    Empresa         VARCHAR(5),
    CentroCosto     VARCHAR(25),
    Cuenta          VARCHAR(30),
    UltimoCambio    DATETIME,
    Modulo          VARCHAR(5)
    
    		
)