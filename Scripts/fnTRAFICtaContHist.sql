SET DATEFIRST 7
SET ANSI_NULLS OFF
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET LOCK_TIMEOUT -1
SET QUOTED_IDENTIFIER OFF
GO

IF EXISTS(SELECT * FROM sysobjects WHERE TYPE='fn' AND NAME='fnTRAFICtaContHist')
DROP FUNCTION fnTRAFICtaContHist
GO
CREATE FUNCTION fnTRAFICtaContHist(@Mov	VARCHAR(30), @MovID	VARCHAR(15), @Modulo VARCHAR(5))
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @Resultado VARCHAR(30),
		   @TienePoliza   BIT
    
    IF @Modulo='CXC'
       SELECT @TienePoliza= ISNULL(c.GenerarPoliza,0)
       FROM Cxc AS c
       WHERE Mov=@Mov
       AND c.MovID=@MovID 
    
    
    IF @Modulo='CXP'
       SELECT @TienePoliza= ISNULL(c.GenerarPoliza,0)
       FROM Cxp AS c
       WHERE Mov=@Mov
       AND c.MovID=@MovID 
	
	IF @TienePoliza=1
	   SELECT @Resultado=cd.Cuenta
	   FROM Cont AS c
	   JOIN ContD AS cd ON cd.ID = c.ID
	   WHERE c.Origen=@Mov
	   AND c.OrigenID=@MovID 
	   AND cd.Cuenta IN (SELECT Cuenta FROM Cta WHERE Familia='RepHistoricoCx')
	
	
RETURN @Resultado
END
