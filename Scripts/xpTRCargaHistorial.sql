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

	DECLARE @MovsAplicaTbl	TABLE(
			Mov		VARCHAR(50),
			MovID	VARCHAR(20),
			Saldo	FLOAT,
			Fecha	DATETIME
	)
	
	TRUNCATE TABLE TRAFIMARHistSaldosCx
	
	IF @Modulo ='CXC'
	BEGIN
		
		INSERT INTO @MovsAplicaTbl
		SELECT Aplica,AplicaID,Abono,Fecha
		FROM Auxiliar
		WHERE Modulo=@Modulo
		
		INSERT INTO TRAFIMARHistSaldosCx(IDOrigen,FechaEmision, Mov, MovID, Cliente,Nombre,Moneda,SubTotal,Impuestos,Total,
				 		    TipoCambio,SubTotalMN,ImpuestosMN,TotalMN,Saldo,Descripcion,Concepto,Sucursal,CentroCosto,Cuenta,Estatus,UltimoCambio,FechaInicio,FechaFin,Modulo)
	     SELECT c.ID AS 'IDOrigen',c.FechaEmision,c.Mov,c.MovID,c.Cliente,c2.Nombre,c.Moneda,c.Importe AS 'SubTotal'
		 ,c.Impuestos
		 ,c.Importe+c.Impuestos AS 'Total'
		 ,c.TipoCambio
		 ,IIF(c.Moneda<>'Pesos',c.Importe*c.TipoCambio,c.Importe) AS 'SubTotalMN'
		 ,IIF(c.Moneda<>'Pesos',c.Impuestos*c.TipoCambio,c.Impuestos) AS 'ImpuestosMN'
		 ,IIF(c.Moneda<>'Pesos',(c.Importe+c.Impuestos)*c.TipoCambio,c.Importe+c.Impuestos) AS 'TotalMN'
		 ,COALESCE(ma.Saldo,c.Saldo,0)
		 ,c.Observaciones AS 'Descripcion'
		 ,c.Concepto,c.Sucursal
		 ,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3) AS 'CentroCosto'
		 ,d.Cuenta
		 ,mt.Estatus
		 ,CAST(ma.Fecha AS DATE) AS 'UltimoCambio'
		 ,CAST(mt.FechaComenzo AS DATE)
		 ,CAST(mt.FechaTermino AS DATE)
		 ,mt.Modulo
	   FROM Cxc AS c					   
	   JOIN Cte AS c2 ON c2.Cliente = c.Cliente
	   LEFT JOIN Cont t ON t.Origen=c.Mov AND t.OrigenID=c.MovID
	   LEFT JOIN ContD d ON d.ID=t.ID AND d.Cuenta IN (SELECT Cuenta FROM Cta WHERE Familia='RepHistoricoCx')
	   LEFT JOIN MovImpuesto AS mi ON mi.ID = c.ID AND mi.Modulo=@Modulo
	   LEFT JOIN @MovsAplicaTbl AS ma ON c.Mov=ma.Mov AND c.MovID=ma.MovID
	   LEFT JOIN MovTiempo AS mt ON mt.ID=c.ID AND mt.Modulo=@Modulo 
	   WHERE FechaComenzo in (SELECT min(FechaComenzo) FROM MovTiempo WHERE ID=c.ID AND Modulo=@Modulo AND Estatus='PENDIENTE' GROUP By Estatus)
	   AND mt.Estatus IN ('PENDIENTE')
	   AND COALESCE(ma.Saldo,c.Saldo,0) > 0
	   UNION ALL
	   SELECT c.ID AS 'IDOrigen',c.FechaEmision,c.Mov,c.MovID,c.Cliente,c2.Nombre,c.Moneda,c.Importe AS 'SubTotal'
		 ,c.Impuestos
		 ,c.Importe+c.Impuestos AS 'Total'
		 ,c.TipoCambio
		 ,IIF(c.Moneda<>'Pesos',c.Importe*c.TipoCambio,c.Importe) AS 'SubTotalMN'
		 ,IIF(c.Moneda<>'Pesos',c.Impuestos*c.TipoCambio,c.Impuestos) AS 'ImpuestosMN'
		 ,IIF(c.Moneda<>'Pesos',(c.Importe+c.Impuestos)*c.TipoCambio,c.Importe+c.Impuestos) AS 'TotalMN'
		 ,c.Saldo
		 ,c.Observaciones AS 'Descripcion'
		 ,c.Concepto,c.Sucursal
		 ,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3) AS 'CentroCosto'
		 ,d.Cuenta
		 ,mt.Estatus
		 ,CAST(mt.FechaComenzo AS DATE) AS 'UltimoCambio'
		 ,CAST(mt.FechaComenzo AS DATE)
		 ,CAST(mt.FechaComenzo AS DATE)
		 ,mt.Modulo
	   FROM Cxc AS c					   
	   JOIN Cte AS c2 ON c2.Cliente = c.Cliente
	   LEFT JOIN Cont t ON t.Origen=c.Mov AND t.OrigenID=c.MovID 
	   LEFT JOIN ContD d ON d.ID=t.ID AND d.Cuenta IN (SELECT Cuenta FROM Cta WHERE Familia='RepHistoricoCx')
	   LEFT JOIN MovImpuesto AS mi ON mi.ID = c.ID AND mi.Modulo=@Modulo
	   LEFT JOIN MovTiempo AS mt ON mt.ID=c.ID AND mt.Modulo=@Modulo 
	   WHERE FechaComenzo in (SELECT min(FechaComenzo) FROM MovTiempo WHERE ID=c.ID AND Modulo=@Modulo AND Estatus='CONCLUIDO' GROUP By Estatus)
	   AND mt.Estatus='CONCLUIDO'
	END
	
	IF @Modulo='CXP'
	BEGIN
		INSERT INTO TRAFIMARHistSaldosCx(IDOrigen,FechaEmision, Mov, MovID, Cliente,Nombre,Moneda,SubTotal,Impuestos,Total,
				 		    TipoCambio,SubTotalMN,ImpuestosMN,TotalMN,Saldo,Descripcion,Concepto,Sucursal,CentroCosto,Cuenta,Estatus,UltimoCambio,FechaInicio,FechaFin,Modulo)
	     SELECT  c.ID AS 'IDOrigen',c.FechaEmision,c.Mov,c.MovID,c.Proveedor,p.Nombre,c.Moneda,c.Importe AS 'SubTotal'
		 ,c.Impuestos
		 ,c.Importe+c.Impuestos AS 'Total'
		 ,c.TipoCambio
		 ,IIF(c.Moneda<>'Pesos',c.Importe*c.TipoCambio,c.Importe) AS 'SubTotalMN'
		 ,IIF(c.Moneda<>'Pesos',c.Impuestos*c.TipoCambio,c.Impuestos) AS 'ImpuestosMN'
		 ,IIF(c.Moneda<>'Pesos',(c.Importe+c.Impuestos)*c.TipoCambio,c.Importe+c.Impuestos) AS 'TotalMN'
		 ,COALESCE(a.Abono,c.Saldo,0)
		 ,c.Observaciones AS 'Descripcion'
		 ,c.Concepto,c.Sucursal
		 ,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3) AS 'CentroCosto'
		 ,d.Cuenta
		 ,mt.Estatus
		 ,CAST(mt.FechaComenzo AS DATE) AS 'UltimoCambio'
		 ,CAST(mt.FechaComenzo AS DATE)
		 ,CAST(mt.FechaTermino AS DATE)
		 ,mt.Modulo
	   FROM Cxp AS c					   
	   JOIN Prov AS p ON p.Proveedor = c.Proveedor
	   LEFT JOIN Cont t ON t.Origen=c.Mov AND t.OrigenID=c.MovID
	   LEFT JOIN ContD d ON d.ID=t.ID AND d.Cuenta IN (SELECT Cuenta FROM Cta WHERE Familia='RepHistoricoCx')
	   LEFT JOIN MovImpuesto AS mi ON mi.ID = c.ID AND mi.Modulo=@Modulo
	   LEFT JOIN MovTiempo AS mt ON mt.ID=c.ID AND mt.Modulo=@Modulo
	   LEFT JOIN Auxiliar a ON a.Aplica=c.Mov AND a.AplicaID=c.MovID AND a.Mov IN ('Cobro','Aplicacion','Endoso') AND a.Modulo='CXC' AND CAST(mt.FechaTermino AS DATE)=a.Fecha
	   WHERE FechaComenzo in (SELECT min(FechaComenzo) FROM MovTiempo WHERE ID=c.ID AND Modulo=@Modulo AND Estatus='PENDIENTE' GROUP By Estatus)
	   AND mt.Estatus IN ('PENDIENTE')
	   AND COALESCE(a.Abono,c.Saldo,0) > 0
	   UNION ALL
	   SELECT  c.ID AS 'IDOrigen',c.FechaEmision,c.Mov,c.MovID,c.Proveedor,p.Nombre,c.Moneda,c.Importe AS 'SubTotal'
		 ,c.Impuestos
		 ,c.Importe+c.Impuestos AS 'Total'
		 ,c.TipoCambio
		 ,IIF(c.Moneda<>'Pesos',c.Importe*c.TipoCambio,c.Importe) AS 'SubTotalMN'
		 ,IIF(c.Moneda<>'Pesos',c.Impuestos*c.TipoCambio,c.Impuestos) AS 'ImpuestosMN'
		 ,IIF(c.Moneda<>'Pesos',(c.Importe+c.Impuestos)*c.TipoCambio,c.Importe+c.Impuestos) AS 'TotalMN'
		 ,c.Saldo
		 ,c.Observaciones AS 'Descripcion'
		 ,c.Concepto,c.Sucursal
		 ,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3) AS 'CentroCosto'
		 ,d.Cuenta
		 ,mt.Estatus
		 ,CAST(mt.FechaComenzo AS DATE) AS 'UltimoCambio'
		 ,CAST(mt.FechaComenzo AS DATE)
		 ,CAST(mt.FechaTermino AS DATE)
		 ,mt.Modulo
	   FROM Cxp AS c					   
	   JOIN Prov AS p ON p.Proveedor = c.Proveedor
	   LEFT JOIN Cont t ON t.Origen=c.Mov AND t.OrigenID=c.MovID 
	   LEFT JOIN ContD d ON d.ID=t.ID AND d.Cuenta IN (SELECT Cuenta FROM Cta WHERE Familia='RepHistoricoCx')
	   LEFT JOIN MovImpuesto AS mi ON mi.ID = c.ID AND mi.Modulo=@Modulo
	   LEFT JOIN MovTiempo AS mt ON mt.ID=c.ID AND mt.Modulo=@Modulo
	   WHERE FechaComenzo in (SELECT min(FechaComenzo) FROM MovTiempo WHERE ID=c.ID AND Modulo=@Modulo AND Estatus='CONCLUIDO' GROUP By Estatus)
	   AND mt.Estatus IN ('CONCLUIDO')
	END
RETURN
END