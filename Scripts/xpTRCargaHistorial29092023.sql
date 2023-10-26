SET DATEFIRST 7
SET ANSI_NULLS OFF
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET LOCK_TIMEOUT -1
SET QUOTED_IDENTIFIER OFF
GO
--EXEC xpTRCargaHistorial 'CXC'
IF EXISTS(SELECT * FROM sysobjects WHERE TYPE='p' AND NAME='xpTRCargaHistorial')
DROP PROCEDURE xpTRCargaHistorial
GO
CREATE PROCEDURE xpTRCargaHistorial
@Modulo VARCHAR(5)
AS
BEGIN
	DECLARE @CentrosCosto	TABLE(
		ID			INT,
		CentroCosto	VARCHAR(25)
	)
	
	TRUNCATE TABLE TRAFIMARHistSaldosCx

	IF @Modulo='CXC'
	BEGIN
		INSERT INTO @CentrosCosto
			SELECT DISTINCT c.ID, COALESCE(d.ContUso,d.ContUso2,d.ContUso3)
			FROM Venta v
			JOIN VentaD d ON v.ID=D.ID
			LEFT JOIN Cxc c ON c.Origen=v.Mov AND c.OrigenID=v.MovID
			WHERE COALESCE(d.ContUso,d.ContUso2,d.ContUso3) IS NOT NULL
			UNION
			SELECT ID, COALESCE(ContUso,ContUso2,ContUso3)
			FROM MovImpuesto
			WHERE Modulo=@Modulo
			AND COALESCE(ContUso,ContUso2,ContUso3) IS NOT NULL
		
		INSERT INTO TRAFIMARHistSaldosCx(IDOrigen,FechaEmision, Mov, MovID, Cliente,Nombre,Moneda,SubTotal,Impuestos,Total,
				 						TipoCambio,SubTotalMN,ImpuestosMN,TotalMN,Saldo,Aplicacion,Descripcion,Concepto,Sucursal,CentroCosto
										,Cuenta,Empresa,UltimoCambio,Modulo)
				SELECT c.ID,c.FechaEmision,c.Mov,c.MovID,c.Cliente,t.Nombre,c.Moneda,c.importe,c.impuestos
					   ,a.Cargo,c.TipoCambio
					   ,IIF(c.Moneda<>'Pesos',c.Importe*c.TipoCambio,c.Importe) AS 'SubTotalMN'
					   ,IIF(c.Moneda<>'Pesos',c.Impuestos*c.TipoCambio,c.Impuestos) AS 'ImpuestosMN'
					   ,IIF(c.Moneda<>'Pesos',(c.Importe+c.Impuestos)*c.TipoCambio,c.Importe+c.Impuestos) AS 'TotalMN'
					   ,IIF((c.Importe+Impuestos)-SUM(DISTINCT COALESCE(e.Abono,a.Cargo,f.Abono,0))>0,(c.Importe+Impuestos)-SUM(DISTINCT COALESCE(e.Abono,a.Cargo,f.Abono,0)),SUM(DISTINCT COALESCE(e.Abono,a.Cargo,f.Abono,0)))
					   ,SUM(DISTINCT COALESCE(e.Abono,f.Abono,0))
					   ,c.Observaciones
					   ,c.Concepto
					   ,c.Sucursal
					   ,cc.CentroCosto
					   ,d.Cuenta
					   ,c.Empresa
					   ,COALESCE(IIF(c.Estatus='PENDIENTE' AND c.Mov<>'Endoso',getdate(),e.Fecha),f.Fecha,IIF(c.Mov IN ('Aplicacion','Aplicacion/Anticipo','Aplicacion Anticipo'),a.Fecha,NULL),GETDATE())
					   ,@Modulo
				FROM Cxc c
				LEFT JOIN Auxiliar a ON c.ID=a.ModuloID AND a.Cargo IS NOT NULL AND a.Abono IS NULL
				LEFT JOIN Auxiliar e ON c.Origen=e.Aplica AND c.OrigenID=e.AplicaID AND a.Empresa=e.Empresa AND e.Abono IS NOT NULL AND e.Cargo IS NULL
				LEFT JOIN Auxiliar f ON f.Mov=a.Aplica AND 	f.MovID=a.AplicaID AND f.Cargo IS NULL AND f.Abono IS NOT NULL
				LEFT JOIN Cte t ON t.Cliente=c.Cliente
				LEFT JOIN @CentrosCosto cc on cc.ID=C.ID
				LEFT JOIN Cont b ON b.Origen=c.Mov AND b.OrigenID=c.MovID
				LEFT JOIN ContD d ON d.ID=b.ID AND d.Cuenta IN (SELECT Cuenta FROM Cta WHERE Familia='RepHistoricoCx')
				WHERE a.Modulo=@Modulo
				AND c.Estatus NOT IN ('CANCELADO','SINAFECTAR')
				GROUP BY c.ID,c.FechaEmision,c.Mov,c.MovID,c.Cliente,t.Nombre,c.Moneda,c.importe,c.impuestos
					   ,a.Cargo,c.TipoCambio,c.Observaciones,c.Concepto,c.Sucursal,cc.CentroCosto
					  ,d.Cuenta,c.Empresa,e.Fecha,a.Fecha,f.Fecha,c.Estatus
	END

	IF @Modulo='CXP'
	BEGIN
		INSERT INTO TRAFIMARHistSaldosCx(IDOrigen,FechaEmision, Mov, MovID, Cliente,Nombre,Moneda,SubTotal,Impuestos,Total,
				 						TipoCambio,SubTotalMN,ImpuestosMN,TotalMN,Saldo,Aplicacion,Descripcion,Concepto,Sucursal,CentroCosto
										,Cuenta,Empresa,UltimoCambio,Modulo)
				SELECT c.ID,c.FechaEmision,c.Mov,c.MovID,c.Proveedor,t.Nombre,c.Moneda,c.importe,c.impuestos
					   ,a.Cargo,c.TipoCambio
					   ,IIF(c.Moneda<>'Pesos',c.Importe*c.TipoCambio,c.Importe) AS 'SubTotalMN'
					   ,IIF(c.Moneda<>'Pesos',c.Impuestos*c.TipoCambio,c.Impuestos) AS 'ImpuestosMN'
					   ,IIF(c.Moneda<>'Pesos',(c.Importe+c.Impuestos)*c.TipoCambio,c.Importe+c.Impuestos) AS 'TotalMN'
					   ,IIF((c.Importe+Impuestos)-SUM(DISTINCT COALESCE(e.Abono,a.Cargo,f.Abono,0))>0,(c.Importe+Impuestos)-SUM(DISTINCT COALESCE(e.Abono,a.Cargo,f.Abono,0)),SUM(DISTINCT COALESCE(e.Abono,a.Cargo,f.Abono,0)))
					   ,SUM(DISTINCT COALESCE(e.Abono,f.Abono,0))
					   ,c.Observaciones
					   ,c.Concepto
					   ,c.Sucursal
					   ,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3)
					   ,d.Cuenta
					   ,c.Empresa
					   ,COALESCE(IIF(c.Estatus='PENDIENTE',getdate(),e.Fecha),f.Fecha,IIF(c.Mov IN ('Aplicacion','Aplicacion/Anticipo','Aplicacion Anticipo'),a.Fecha,NULL),GETDATE())
					   ,@Modulo
				FROM Cxp c
				LEFT JOIN Auxiliar a ON c.ID=a.ModuloID AND a.Cargo IS NOT NULL AND a.Abono IS NULL
				LEFT JOIN Auxiliar e ON c.Origen=e.Aplica AND c.OrigenID=e.AplicaID AND a.Empresa=e.Empresa AND e.Abono IS NOT NULL AND e.Cargo IS NULL
				LEFT JOIN Auxiliar f ON f.Mov=a.Aplica AND 	f.MovID=a.AplicaID AND f.Cargo IS NULL AND f.Abono IS NOT NULL
				LEFT JOIN Prov t ON t.Proveedor=c.Proveedor
				LEFT JOIN MovImpuesto mi ON mi.ID=c.ID AND mi.Modulo=@Modulo
				LEFT JOIN Cont b ON b.Origen=c.Mov AND b.OrigenID=c.MovID
				LEFT JOIN ContD d ON d.ID=b.ID AND d.Cuenta IN (SELECT Cuenta FROM Cta WHERE Familia='RepHistoricoCx')
				WHERE a.Modulo=@Modulo
				AND c.Estatus NOT IN ('CANCELADO','SINAFECTAR')
				GROUP BY c.ID,c.FechaEmision,c.Mov,c.MovID,c.Proveedor,t.Nombre,c.Moneda,c.importe,c.impuestos
					   ,a.Cargo,c.TipoCambio,c.Observaciones,c.Concepto,c.Sucursal,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3)
					   ,d.Cuenta,c.Empresa,e.Fecha,a.Fecha,f.Fecha,c.Estatus
	END

END





