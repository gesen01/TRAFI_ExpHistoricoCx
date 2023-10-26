SELECT *
FROM TRAFIMARHistSaldosCx
WHERE FechaEmision<='20230531'
AND UltimoCambio>'20230531'
--AND Total-Aplicacion > 0
--AND Mov NOT IN ('Aplicacion/anticipo','Aplica Dep Garantia','Aplicacion','Aplicacion Anticipo')
AND Cuenta='1103-002-00000-000'
--AND Empresa='NLS'
AND Mov='Factura Nort Hyundai'
--AND MovID='119486'
ORDER BY  MovID ASC

SELECT *
FROM Auxiliar
where Mov='Factura Nort Hoegh'
AND MovID='3438'
AND Cargo IS NOT NULL

SELECT *
FROM Auxiliar
WHERE Aplica='Factura Nort Hoegh'
AND AplicaID='3438'
AND Abono IS NOT NULL

SELECT Estatus,Importe+Impuestos,Origen,OrigenID,*
FROM CXC
WHERE Mov='Factura Nort Hoegh'
AND MovID='3438'

SELECT c.ID,c.FechaEmision,c.Mov,c.MovID,c.Cliente,t.Nombre,c.Moneda,c.importe,c.impuestos,c.Proyecto,c.Referencia
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
					   --,COALESCE(mi.ContUso,mi.ContUso2,mi.ContUso3)
					   ,d.Cuenta
					   ,c.Empresa
					   ,COALESCE(IIF(c.Estatus='PENDIENTE' AND c.Mov<>'Endoso',getdate(),e.Fecha),f.Fecha,IIF(c.Mov IN ('Aplicacion','Aplicacion/Anticipo','Aplicacion Anticipo'),a.Fecha,NULL),GETDATE())
					   ,g.Vencimiento
					   ,DATEDIFF(DD,ISNULL(g.Vencimiento,c.FechaEmision),GETDATE()) AS 'DiasVencidos'
					   ,DATEDIFF(DD,c.FechaEmision,GETDATE()) AS 'DiasTranscurridos'
					   ,IIF(DATEDIFF(DD,ISNULL(g.Vencimiento,c.FechaEmision),GETDATE())<0,ISNULL(g.Saldo,0),0) AS 'SinVencer'
					   ,IIF(DATEDIFF(DD,ISNULL(g.Vencimiento,c.FechaEmision),GETDATE()) BETWEEN 1 AND 30,ISNULL(g.Saldo,0),0) AS 'Menos30'
					   ,IIF(DATEDIFF(DD,ISNULL(g.Vencimiento,c.FechaEmision),GETDATE()) BETWEEN 31 AND 60,ISNULL(g.Saldo,0),0) AS 'Entre3160'
					   ,IIF(DATEDIFF(DD,ISNULL(g.Vencimiento,c.FechaEmision),GETDATE()) BETWEEN 61 AND 90,ISNULL(g.Saldo,0),0) AS 'Entre6190'
					   ,IIF(DATEDIFF(DD,ISNULL(g.Vencimiento,c.FechaEmision),GETDATE()) >90,ISNULL(g.Saldo,0),0) AS 'Mas90'
					   --,@Modulo
				FROM Cxc c
				LEFT JOIN CxcInfo g ON c.ID=g.ID AND c.Empresa=g.Empresa
				LEFT JOIN Auxiliar a ON c.ID=a.ModuloID AND a.Cargo IS NOT NULL AND a.Abono IS NULL
				LEFT JOIN Auxiliar e ON c.Origen=e.Aplica AND c.OrigenID=e.AplicaID AND a.Empresa=e.Empresa AND e.Abono IS NOT NULL AND e.Cargo IS NULL
				LEFT JOIN Auxiliar f ON f.Mov=a.Aplica AND 	f.MovID=a.AplicaID AND f.Cargo IS NULL AND f.Abono IS NOT NULL
				LEFT JOIN Cte t ON t.Cliente=c.Cliente
				LEFT JOIN @CentrosCosto cc on cc.ID=C.ID
				--LEFT JOIN MovImpuesto mi ON mi.ID=c.ID AND mi.Modulo='CXC'
				LEFT JOIN Cont b ON b.Origen=c.Mov AND b.OrigenID=c.MovID
				LEFT JOIN ContD d ON d.ID=b.ID AND d.Cuenta IN (SELECT Cuenta FROM Cta WHERE Familia='RepHistoricoCx')
				WHERE a.Modulo='CXC'
				AND c.Estatus NOT IN ('CANCELADO','SINAFECTAR')
				GROUP BY c.ID,c.FechaEmision,c.Mov,c.MovID,c.Cliente,t.Nombre,c.Moneda,c.importe,c.impuestos
					   ,a.Cargo,c.TipoCambio,c.Observaciones,c.Concepto,c.Sucursal,cc.CentroCosto,g.Vencimiento
					  ,d.Cuenta,c.Empresa,e.Fecha,a.Fecha,f.Fecha,c.Estatus,g.Saldo,c.Proyecto,c.Referencia