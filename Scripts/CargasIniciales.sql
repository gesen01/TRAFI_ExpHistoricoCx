--Carga Inicial CXP
INSERT INTO TRAFIMARHistSaldosCx(IDOrigen,FechaEmision, Mov, MovID, Cliente,Nombre,Moneda,SubTotal,Impuestos,Total,
				 		TipoCambio,SubTotalMN,ImpuestosMN,TotalMN,Descripcion,Concepto,Sucursal,CentroCosto,Cuenta,Estatus,UltimoCambio,Modulo)
				  SELECT DISTINCT  c.ID,c.FechaEmision,c.Mov,c.MovID,c.Proveedor,p.Nombre,c.Moneda,c.Importe,c.Impuestos,
					   c.Importe+c.Impuestos,c.TipoCambio,
					   IIF(c.Moneda<>'Pesos',c.Importe*c.TipoCambio,c.Importe),
					   IIF(c.Moneda<>'Pesos',c.Impuestos*c.TipoCambio,c.Impuestos),
					   IIF(c.Moneda<>'Pesos',(c.Importe+c.Impuestos)*c.TipoCambio,c.Importe+c.Impuestos),
					   c.Observaciones,c.Concepto,c.Sucursal,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3),t.Cuenta,c.Estatus,c.UltimoCambio,'CXP'
				  FROM Cxp AS c			
				  JOIN Prov AS p ON p.Proveedor = c.Proveedor
				  JOIN Concepto t ON c.Concepto=t.Concepto AND t.Modulo IN ('CXP','CXC')
				  LEFT JOIN MovImpuesto AS mi ON mi.ID = c.ID AND mi.Modulo='CXP'
				  WHERE c.Estatus IN ('PENDIENTE','CONCLUIDO')
--Carga Inicial CXC
INSERT INTO TRAFIMARHistSaldosCx(IDOrigen,FechaEmision, Mov, MovID, Cliente,Nombre,Moneda,SubTotal,Impuestos,Total,
				 		TipoCambio,SubTotalMN,ImpuestosMN,TotalMN,Descripcion,Concepto,Sucursal,CentroCosto,Cuenta,Estatus,UltimoCambio,Modulo)
				SELECT DISTINCT c.ID,c.FechaEmision,c.Mov,c.MovID,c.Cliente,c2.Nombre,c.Moneda,c.Importe,c.Impuestos,
					   c.Importe+c.Impuestos,c.TipoCambio,
					   IIF(c.Moneda<>'Pesos',c.Importe*c.TipoCambio,c.Importe),
					   IIF(c.Moneda<>'Pesos',c.Impuestos*c.TipoCambio,c.Impuestos),
					   IIF(c.Moneda<>'Pesos',(c.Importe+c.Impuestos)*c.TipoCambio,c.Importe+c.Impuestos),
					   c.Observaciones,c.Concepto,c.Sucursal,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3),t.Cuenta,c.Estatus,c.UltimoCambio,'CXC'
				  FROM Cxc AS c					   
				  JOIN Cte AS c2 ON c2.Cliente = c.Cliente
				  JOIN Concepto t ON c.Concepto=t.Concepto AND t.Modulo IN ('CXP','CXC')
				  LEFT JOIN MovImpuesto AS mi ON mi.ID = c.ID AND mi.Modulo='CXC'
				WHERE C.Estatus IN ('PENDIENTE','CONCLUIDO')