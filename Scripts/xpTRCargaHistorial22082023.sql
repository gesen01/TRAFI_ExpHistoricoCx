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
	TRUNCATE TABLE TRAFIMARHistSaldosCx

	IF @Modulo='CXC'
	BEGIN
		INSERT INTO TRAFIMARHistSaldosCx(IDOrigen,FechaEmision, Mov, MovID, Cliente,Nombre,Moneda,SubTotal,Impuestos,Total,
				 						TipoCambio,SubTotalMN,ImpuestosMN,TotalMN,Saldo,Aplicacion,Descripcion,Concepto,Sucursal,CentroCosto
										,Cuenta,Empresa,UltimoCambio,Modulo)
				SELECT c.ID,c.FechaEmision,c.Mov,c.MovID,c.Cliente,t.Nombre,c.Moneda,c.importe,c.impuestos
					   ,a.Cargo,c.TipoCambio
					   ,IIF(c.Moneda<>'Pesos',c.Importe*c.TipoCambio,c.Importe) AS 'SubTotalMN'
					   ,IIF(c.Moneda<>'Pesos',c.Impuestos*c.TipoCambio,c.Impuestos) AS 'ImpuestosMN'
					   ,IIF(c.Moneda<>'Pesos',(c.Importe+c.Impuestos)*c.TipoCambio,c.Importe+c.Impuestos) AS 'TotalMN'
					   ,SUM(COALESCE(e.Abono,a.Cargo,0))
					   ,SUM(ISNULL(e.Abono,0))
					   ,c.Observaciones
					   ,c.Concepto
					   ,c.Sucursal
					   ,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3)
					   ,d.Cuenta
					   ,c.Empresa
					   ,COALESCE(e.Fecha,a.Fecha,GETDATE())
					   ,@Modulo
				FROM Cxc c
				LEFT JOIN Auxiliar a ON c.ID=a.ModuloID AND a.Cargo IS NOT NULL AND a.Abono IS NULL
				LEFT JOIN Auxiliar e ON c.Mov=e.Aplica AND c.MovID=e.AplicaID AND e.Abono IS NOT NULL AND e.Cargo IS NULL
				LEFT JOIN Cte t ON t.Cliente=c.Cliente
				LEFT JOIN MovImpuesto mi ON mi.ID=c.ID AND mi.Modulo=@Modulo
				LEFT JOIN Cont b ON b.Origen=c.Mov AND b.OrigenID=c.MovID
				LEFT JOIN ContD d ON d.ID=b.ID AND d.Cuenta IN (SELECT Cuenta FROM Cta WHERE Familia='RepHistoricoCx')
				WHERE a.Modulo=@Modulo
				AND c.Estatus NOT IN ('CANCELADO','CONCLUIDO','SINAFECTAR')
				GROUP BY c.ID,c.FechaEmision,c.Mov,c.MovID,c.Cliente,t.Nombre,c.Moneda,c.importe,c.impuestos
					   ,a.Cargo,c.TipoCambio,c.Observaciones,c.Concepto,c.Sucursal,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3)
					   ,d.Cuenta,c.Empresa,COALESCE(e.Fecha,a.Fecha,GETDATE())
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
					   ,SUM(COALESCE(e.Abono,a.Cargo,0))
					   ,SUM(ISNULL(e.Abono,0))
					   ,c.Observaciones
					   ,c.Concepto
					   ,c.Sucursal
					   ,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3)
					   ,d.Cuenta
					   ,c.Empresa
					   ,COALESCE(e.Fecha,a.Fecha,GETDATE())
					   ,@Modulo
				FROM Cxp c
				LEFT JOIN Auxiliar a ON c.ID=a.ModuloID AND a.Cargo IS NOT NULL AND a.Abono IS NULL
				LEFT JOIN Auxiliar e ON c.Mov=e.Aplica AND c.MovID=e.AplicaID AND e.Abono IS NOT NULL AND e.Cargo IS NULL
				LEFT JOIN Prov t ON t.Proveedor=c.Proveedor
				LEFT JOIN MovImpuesto mi ON mi.ID=c.ID AND mi.Modulo=@Modulo
				LEFT JOIN Cont b ON b.Origen=c.Mov AND b.OrigenID=c.MovID
				LEFT JOIN ContD d ON d.ID=b.ID AND d.Cuenta IN (SELECT Cuenta FROM Cta WHERE Familia='RepHistoricoCx')
				WHERE a.Modulo=@Modulo
				AND c.Estatus NOT IN ('CANCELADO','CONCLUIDO','SINAFECTAR')
				GROUP BY c.ID,c.FechaEmision,c.Mov,c.MovID,c.Proveedor,t.Nombre,c.Moneda,c.importe,c.impuestos
					   ,a.Cargo,c.TipoCambio,c.Observaciones,c.Concepto,c.Sucursal,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3)
					   ,d.Cuenta,c.Empresa,COALESCE(e.Fecha,a.Fecha,GETDATE())
	END

END


