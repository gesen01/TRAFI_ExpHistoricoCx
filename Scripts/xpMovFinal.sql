SET DATEFIRST 7
SET ANSI_NULLS OFF
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET LOCK_TIMEOUT -1
SET QUOTED_IDENTIFIER OFF
GO

IF EXISTS(SELECT * FROM sysobjects WHERE TYPE='p' AND NAME='xpMovFinal')
DROP PROCEDURE xpMovFinal
GO

CREATE PROCEDURE [dbo].[xpMovFinal]
					@Empresa		char(5),
					@Sucursal		int,
					@Modulo			char(5),
					@ID				int,
					@Estatus		char(15),
					@EstatusNuevo	char(15),
					@Usuario		char(10),
					@FechaEmision	datetime,
					@FechaRegistro	datetime,
					@Mov			char(20),
					@MovID			varchar(20),
					@MovTipo		char(20),
					@IDGenerar		int,
					@Ok				int		OUTPUT,
					@OkRef			varchar(255)	OUTPUT
AS BEGIN
  DECLARE 
  
	@Proyecto		varchar(50),
	@Movimiento		varchar(20),
	@Accion			varchar(20),
	@TipoContacto	varchar(15),
	@Acreedor		varchar(10),
	@IDAportacionCV	int,
	@MovAplica		varchar(20),
	@Origen			VARCHAR(20),
	@origenID		VARCHAR(20),
	@SucOrigen		INT

	
	--select @Sucursal as 'Sucursal'

    IF @Estatus IN ('SINAFECTAR','BORRADOR') AND @EstatusNuevo IN ('PENDIENTE', 'CONCLUIDO')  

      SELECT @Accion = 'AFECTAR'  
      
    IF @Estatus IN ('PENDIENTE','CONCLUIDO') AND @EstatusNuevo = 'CANCELADO'  

      SELECT @Accion = 'CANCELAR' 
	  
	IF @Modulo = 'CXP'
	BEGIN

		SELECT @MovAplica = MovAplica FROM Cxp WHERE ID = @ID

		IF @Mov = 'Cambio Divisas'
		
			EXEC spTFGeneraCxpDeslizamiento @ID, @Accion, NULL, NULL

		IF @Mov = 'Devolucion CT'
			
			EXEC spTFGeneraCxpDeslizamientoDCT @ID, @Accion, @Ok, @OkRef

		IF @Mov IN ('Aplicacion Corresp','Aplicacion') AND @MovAplica IN ('Dev Cargo Tercero'/*,'Credito Proveedor'*/) AND @Ok IS NULL

			EXEC spTMGeneraDevCargoTerceros @ID, @Accion

		SELECT @Acreedor = Proveedor FROM Cxp WHERE ID = @ID	
		 
		SELECT @MovTipo = Clave FROM MovTipo WHERE Modulo = 'CXP' AND Mov = @Mov

		SELECT @TipoContacto = Tipo FROM Prov WHERE Proveedor = @Acreedor

		IF @MovTipo = 'CXP.P' AND @TipoContacto IN ('Acred Inter Ext','Acred Inter Nal','Acreedores Ext','Acreedores Nac','Prov Inter Ext','Prov Inter Nal','Proveedor Ext','Proveedor Nac','Corresp Ext','Corresp Nac') AND @Empresa = 'NLS'
		BEGIN

			EXEC spTMInterfazIntelisis @ID, 'Crear', NULL, NULL, @Modulo, @Accion

		END
					
		/*10/02/2023. IGGR. Se agrego una subconsulta que obtiene todas las empresas que tienen activa la opcion para la interfaz */
		IF @Mov IN ('Gasto','Gasto Prorrateado') AND @TipoContacto IN ('Acred Inter Ext','Acred Inter Nal','Acreedores Ext','Acreedores Nac','Prov Inter Ext','Prov Inter Nal','Proveedor Ext','Proveedor Nac','Corresp Ext','Corresp Nac') AND @Empresa IN (SELECT Empresa FROM TMOperacionCFG WHERE TMInterfazGAS=1)
		BEGIN
			/*30/03/2023. IGGR. Se valida que no exista el movimiento de gasto o gasto prorrateado en el repositorio antes de insertarlo*/
			IF NOT EXISTS(SELECT 1 FROM TRAFIMAR_REPOSITORIO.dbo.CxpTM WHERE IDModulo=@ID)
				EXEC spTMInterfazIntelisis @ID, 'Crear', NULL, NULL, @Modulo, @Accion

		END

	END		   

	---------------------------Desarrollo Movimiento espejo GASTO DEMORAS  MML. 24/05/2023.-----------------------------------------------
	IF @Modulo = 'VTAS' AND @Accion = 'AFECTAR'  
	BEGIN
	EXEC spTFGenerarGastoDEM @ID, @Accion, NULL, NULL		
	END
	
	--------------------------------------------------------------------------------------------------------------------------------------


	IF @Modulo = 'GAS'
	BEGIN
		IF @Mov = 'Cargo Terceros'
		BEGIN
			
			SELECT @Origen=Origen,@OrigenID=OrigenID
			FROM Gasto
			WHERE ID=@ID
			
			SELECT @SucOrigen=Sucursal
			FROM Gasto
			WHERE Mov=@Origen
			AND MovID=@OrigenID

			UPDATE Gasto SET  Sucursal=@SucOrigen
			WHERE ID=@ID

			EXEC spTFGeneraCxcCT @ID, @Accion, @Ok, @OkRef

			EXEC spTFGeneraCxcDeslizamiento @ID, @Accion, @Ok, @OkRef

		END

		SELECT @Acreedor = Acreedor
		FROM Gasto WHERE ID = @ID	--IGGR. 03/04/2023. Se asigna el acreeedor del movimiento de gasto 
		
		SELECT @TipoContacto = Tipo FROM Prov WHERE Proveedor = @Acreedor

		IF @Mov IN ('Solicitud','Gasto','Gasto Prorrateado','Cargo Terceros','Comprobante') AND @TipoContacto IN ('Acred Inter Ext','Acred Inter Nal','Acreedores Ext','Acreedores Nac','Prov Inter Ext','Prov Inter Nal','Proveedor Ext','Proveedor Nac','Corresp Ex
t','Corresp Nac') AND @Empresa = 'NLS'
		BEGIN
		
			EXEC spTMInterfazIntelisis @ID, 'Crear', NULL, NULL, @Modulo, @Accion

		END

	END   

	IF @Modulo = 'NOM'-- AND @MovTipo = 'NOM.P' --AND @EstatusNuevo = 'CANCELADO'
	BEGIN
	
		IF @MovTipo = 'NOM.P' AND @EstatusNuevo = 'CANCELADO'
    
			UPDATE TMMestreComision SET Procesado = 'No', IncidenciaID = NULL WHERE IncidenciaID = @ID

		IF @MovTipo = 'NOM.N'
		BEGIN

			EXEC spTFProrrateoNominaCC @ID, @Accion, @Ok, @OkRef

			EXEC spTMNominaCXCSGMM @ID, @Accion, @OK, @OkRef

		END

		IF @Mov = 'Devolucion CV' AND @EstatusNuevo = 'CANCELADO'
		BEGIN

			SELECT @IDAportacionCV = IDAportacionCV FROM Nomina WHERE ID = @ID

			UPDATE Nomina SET GenerarDevolucionCV = 1 WHERE ID = @IDAportacionCV

		END
  
	END
  /***************************************TRAFIMAR SCORECARDS*********************************************************/
	IF @Modulo='TMOPS'/*AND @MovTipo IN('TMOPS.SA','TMOPS.SATRS','TMOPS.SATT','TMOPS.SCLASS','TMOPS.SDIESEL','TMOPS.SE','TMOPS.SF','TMOPS.SI','TMOPS.SJAGUAR','TMOPS.SL','TMOPS.SMC','TMOPS.SMV','TMOPS.SN','TMOPS.SLARMMESTRE','TMOPS.ST','TMOPS.STL')*/AND @Estatus='PENDIENTE' 
	BEGIN
	
		SELECT @Proyecto=Proyecto, @Movimiento=Mov FROM TMOperacion WHERE ID=@ID
	
		EXEC spInsertaScoreCard @ID, @Proyecto, @Movimiento, @Usuario
  
	END
  /***************************************TRAFIMAR SCORECARDS*********************************************************/
	IF @Modulo = 'DIN'
	BEGIN

		SELECT @MovTipo = Clave FROM MovTipo WHERE Modulo = 'DIN' AND Mov = @Mov

		IF @MovTipo IN ('DIN.CHE','DIN.CH')  AND @Empresa = 'NLS'
		BEGIN

			EXEC spTMInterfazIntelisis @ID, 'Crear', NULL, NULL, @Modulo, @Accion

		END

	END


RETURN
END







