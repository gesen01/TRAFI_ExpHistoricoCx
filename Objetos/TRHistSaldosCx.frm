
[Forma]
Clave=TRHistSaldosCx
Icono=0
Modulos=(Todos)
Nombre=<T>Historico de saldos pendientes - <T>+Info.Modulo
VentanaTipoMarco=Normal
VentanaPosicionInicial=Centrado
VentanaEscCerrar=S
VentanaEstadoInicial=Normal
VentanaColor=Plata
BarraHerramientas=S
AccionesTamanoBoton=15x5
AccionesDerecha=S

ListaCarpetas=Lista
CarpetaPrincipal=Lista
PosicionInicialIzquierda=22
PosicionInicialArriba=87
PosicionInicialAlturaCliente=518
PosicionInicialAncho=1321
ListaAcciones=(Lista)
ExpresionesAlMostrar=Asigna(Info.Mov,Nulo)<BR>Asigna(Info.CentroCostos,Nulo)<BR>Asigna(Info.TRCuentaCx,Nulo)<BR>Asigna(Info.Fecha,Nulo)
ExpresionesAlCerrar=Asigna(Info.Mov,Nulo)<BR>Asigna(Info.CentroCostos,Nulo)<BR>Asigna(Info.TRCuentaCx,Nulo)<BR>Asigna(Info.Fecha,Nulo)
[Lista]
Estilo=Iconos
PestanaOtroNombre=S
Clave=Lista
Filtros=S
OtroOrden=S
BusquedaRapidaControles=S
AlineacionAutomatica=S
AcomodarTexto=S
MostrarConteoRegistros=S
Zona=A1
Vista=TRHistSaldosCx
Fuente={Tahoma, 8, Negro, []}
IconosCampo=(sin Icono)
IconosEstilo=Detalles
IconosAlineacion=de Arriba hacia Abajo
ElementosPorPaginaEsp=200
CampoColorLetras=Negro
CampoColorFondo=Blanco
NavAlineacion=Izquierda
NavPosicion=Arriba
NavNumeracionFuente={MS Sans Serif, 8, Negro, []}
NavColorBoton=Plata
NavColorFondo=Plata
FiltroPredefinido=S
FiltroNullNombre=(sin clasificar)
FiltroEnOrden=S
FiltroTodoNombre=(Todo)
FiltroAncho=20
FiltroRespetar=S
FiltroTipo=General
FiltroModificarEstatus=S
FiltroCambiarPeriodo=S
FiltroBuscarEn=S
FiltroFechasCambiar=S
FiltroFechasNormal=S
FiltroFechasNombre=&Fecha
FuenteBusqueda={MS Sans Serif, 8, Negro, []}
CarpetaVisible=S
ListaEnCaptura=(Lista)

ListaOrden=(Lista)
Paginacion=S
PaginacionTamano=1000
FiltroMonedas=S
FiltroSucursales=S
FiltroListaEstatus=(Lista)
FiltroEstatusDefault=PENDIENTE
FiltroFechasCampo=TRHistSaldosCx.UltimoCambio
FiltroFechasDefault=Este Mes
FiltroMonedasCampo=TRHistSaldosCx.Moneda
BusquedaRapida=S
BusquedaEnLinea=S
IconosSubTitulo=<T>Movimiento<T>


FiltroEmpresas=S
IconosNombre=TRHistSaldosCx.Mov+<T> <T>+TRHistSaldosCx.MovID
FiltroGeneral={Si(ConDatos(Info.Modulo),<T>TRHistSaldosCx.Modulo=<T>+Comillas(Info.Modulo),<T>1=1<T>)}<BR>AND {Si(ConDatos(Info.CentroCostos),<T>TRHistSaldosCx.CentroCosto=<T>+Comillas(Info.CentroCostos),<T>1=1<T>)}<BR>AND {Si(ConDatos(Info.Mov),<T>TRHistSaldosCx.Mov=<T>+Comillas(Info.Mov),<T>1=1<T>)}<BR>AND {Si(ConDatos(Info.TRCuentaCx),<T>TRHistSaldosCx.Cuenta=<T>+Comillas(Info.TRCuentaCx),<T>1=1<T>)}<BR>AND {Si(ConDatos(Info.Fecha),<T>TRHistSaldosCx.FechaEmision<=<T>+Comillas(FechaFormatoServidor(Info.Fecha)),<T>1=1<T>)}<BR>AND {Si(ConDatos(Info.Fecha),<T>TRHistSaldosCx.UltimoCambio><T>+Comillas(FechaFormatoServidor(Info.Fecha)),<T>1=1<T>)}
[Lista.TRHistSaldosCx.FechaEmision]
Carpeta=Lista
Clave=TRHistSaldosCx.FechaEmision
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco

[Lista.TRHistSaldosCx.Cliente]
Carpeta=Lista
Clave=TRHistSaldosCx.Cliente
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
Tamano=20
ColorFondo=Blanco

[Lista.TRHistSaldosCx.Nombre]
Carpeta=Lista
Clave=TRHistSaldosCx.Nombre
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
Tamano=150
ColorFondo=Blanco

[Lista.TRHistSaldosCx.Moneda]
Carpeta=Lista
Clave=TRHistSaldosCx.Moneda
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
Tamano=10
ColorFondo=Blanco

[Lista.TRHistSaldosCx.SubTotal]
Carpeta=Lista
Clave=TRHistSaldosCx.SubTotal
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco

[Lista.TRHistSaldosCx.Impuestos]
Carpeta=Lista
Clave=TRHistSaldosCx.Impuestos
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco

[Lista.TRHistSaldosCx.Total]
Carpeta=Lista
Clave=TRHistSaldosCx.Total
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco

[Lista.TRHistSaldosCx.TipoCambio]
Carpeta=Lista
Clave=TRHistSaldosCx.TipoCambio
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco

[Lista.TRHistSaldosCx.SubTotalMN]
Carpeta=Lista
Clave=TRHistSaldosCx.SubTotalMN
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco

[Lista.TRHistSaldosCx.ImpuestosMN]
Carpeta=Lista
Clave=TRHistSaldosCx.ImpuestosMN
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco

[Lista.TRHistSaldosCx.TotalMN]
Carpeta=Lista
Clave=TRHistSaldosCx.TotalMN
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco

[Lista.TRHistSaldosCx.Descripcion]
Carpeta=Lista
Clave=TRHistSaldosCx.Descripcion
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
Tamano=255
ColorFondo=Blanco

[Lista.TRHistSaldosCx.Concepto]
Carpeta=Lista
Clave=TRHistSaldosCx.Concepto
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
Tamano=100
ColorFondo=Blanco

[Lista.TRHistSaldosCx.Sucursal]
Carpeta=Lista
Clave=TRHistSaldosCx.Sucursal
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco

[Lista.TRHistSaldosCx.CentroCosto]
Carpeta=Lista
Clave=TRHistSaldosCx.CentroCosto
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
Tamano=15
ColorFondo=Blanco


[Lista.TRHistSaldosCx.UltimoCambio]
Carpeta=Lista
Clave=TRHistSaldosCx.UltimoCambio
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco


[Lista.Columnas]
0=174
1=76
2=73
3=360
4=50
5=78
6=62
7=64
8=95
9=104
10=88
11=86
12=84
13=217
14=193
15=150
16=67
17=97






CentroCostos=127
Descripcion=235
18=48
19=76
Cuenta=124
[Acciones.Cerrar]
Nombre=Cerrar
Boton=23
NombreEnBoton=S
NombreDesplegar=&Cerrar
EnBarraHerramientas=S
TipoAccion=Ventana
ClaveAccion=Cerrar
Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
NombreEnBotonX=S
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda


[Acciones.Excel]
Nombre=Excel
Boton=115
NombreDesplegar=&Excel
EnBarraHerramientas=S
EspacioPrevio=S
Carpeta=(Carpeta principal)
TipoAccion=Controles Captura
ClaveAccion=Enviar a Excel
Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda



[Acciones.Personalizar]
Nombre=Personalizar
Boton=45
NombreDesplegar=&Personalizar Vista
EnBarraHerramientas=S
Carpeta=(Carpeta principal)
TipoAccion=Controles Captura
ClaveAccion=Mostrar Campos
Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda



[Acciones.Navegacion]
Nombre=Navegacion
Boton=0
NombreDesplegar=&Navegación
EnBarraHerramientas=S
TipoAccion=Herramientas Captura
ClaveAccion=Navegador Paginacion
Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda











EspacioPrevio=S














[Acciones.CentroCosto]
Nombre=CentroCosto
Boton=195
NombreEnBoton=S
NombreDesplegar=&Centro de costos
EnBarraHerramientas=S
TipoAccion=Expresion
Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
NombreEnBotonX=S
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda

EspacioPrevio=S



































Expresion=FormaModal(<T>EspecificarCC<T>)<BR>ActualizarVista
[Forma.Modulos]
(Inicio)=(Todos)
(Todos)=CXC
CXC=CXP
CXP=(Fin)





[Acciones.Movimiento]
Nombre=Movimiento
Boton=58
NombreEnBoton=S
NombreDesplegar=&Movimiento
EnBarraHerramientas=S
TipoAccion=Expresion
Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
NombreEnBotonX=S
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda






Expresion=Si<BR>  Info.Modulo=<T>CXC<T><BR>Entonces<BR>  FormaModal(<T>EspecificarTMMovCXC<T>)<BR>  ActualizarVista<BR>Sino<BR>  FormaModal(<T>EspecificarTMMovCXP<T>)<BR>  ActualizarVista<BR>Fin
[Acciones.Actualizar]
Nombre=Actualizar
Boton=82
NombreEnBoton=S
NombreDesplegar=A&ctualizar Vista
EnBarraHerramientas=S
TipoAccion=Expresion
Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
NombreEnBotonX=S
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda


























EspacioPrevio=S



Expresion=Asigna(Info.Mov,Nulo)<BR>Asigna(Info.CentroCostos,Nulo)<BR>Asigna(Info.TRCuentaCx,Nulo)<BR>Asigna(Info.Fecha,Nulo)<BR>ActualizarVista
[Acciones.CuentasContables]
Nombre=CuentasContables
Boton=99
NombreEnBoton=S
NombreDesplegar=Cuentas Cont
EnBarraHerramientas=S
TipoAccion=Expresion
Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
NombreEnBotonX=S
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda















Expresion=FormaModal(<T>TREspecificarCC<T>)<BR>ActualizarVista























[Lista.TRHistSaldosCx.Cuenta]
Carpeta=Lista
Clave=TRHistSaldosCx.Cuenta
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
Tamano=30
ColorFondo=Blanco





















[Acciones.Fecha.Fechas]
Nombre=Fechas
Boton=0
TipoAccion=Formas
ClaveAccion=EspecificarFecha
Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda

[Acciones.Fecha.Actualizar]
Nombre=Actualizar
Boton=0
TipoAccion=Controles Captura
ClaveAccion=Actualizar Vista
Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda

[Acciones.Fecha]
Nombre=Fecha
Boton=9
NombreEnBoton=S
NombreDesplegar=&Fecha
Multiple=S
EnBarraHerramientas=S
TipoAccion=Formas
ListaAccionesMultiples=(Lista)

Activo=S
Visible=S
BarraBtnFondo=Plata
BarraBtnFuente={MS Sans Serif, 8, Negro, []}
BarraBtnTxtAlign=Izquierda
BarraBtnTxtPos=Arriba
NombreEnBotonX=S
BarraBtnSubtitFuente={MS Sans Serif, 8, Negro, []}
BarraBtnDescripFuente={MS Sans Serif, 8, Negro, []}
BarraBtnImgPos=Arriba
BarraBtnImgAlign=Izquierda
BarraBtnSubtituloAli=Izquierda
BarraBtnDescripcionAli=Izquierda
BarraBtnSubtituloPos=Arriba
BarraBtnDescripcionPos=Arriba
AccionSecTextoFuente={MS Sans Serif, 8, Negro, []}
AccionSecColor=Plata
AccionSecAli=Izquierda
[Acciones.Fecha.ListaAccionesMultiples]
(Inicio)=Fechas
Fechas=Actualizar
Actualizar=(Fin)







































[Lista.SaldoFinal]
Carpeta=Lista
Clave=SaldoFinal
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
ColorFondo=Blanco




























































[Lista.ListaEnCaptura]
(Inicio)=TRHistSaldosCx.FechaEmision
TRHistSaldosCx.FechaEmision=TRHistSaldosCx.Cliente
TRHistSaldosCx.Cliente=TRHistSaldosCx.Nombre
TRHistSaldosCx.Nombre=TRHistSaldosCx.Moneda
TRHistSaldosCx.Moneda=TRHistSaldosCx.SubTotal
TRHistSaldosCx.SubTotal=TRHistSaldosCx.Impuestos
TRHistSaldosCx.Impuestos=TRHistSaldosCx.Total
TRHistSaldosCx.Total=TRHistSaldosCx.TipoCambio
TRHistSaldosCx.TipoCambio=TRHistSaldosCx.SubTotalMN
TRHistSaldosCx.SubTotalMN=TRHistSaldosCx.ImpuestosMN
TRHistSaldosCx.ImpuestosMN=TRHistSaldosCx.TotalMN
TRHistSaldosCx.TotalMN=SaldoFinal
SaldoFinal=TRHistSaldosCx.Descripcion
TRHistSaldosCx.Descripcion=TRHistSaldosCx.Concepto
TRHistSaldosCx.Concepto=TRHistSaldosCx.Cuenta
TRHistSaldosCx.Cuenta=TRHistSaldosCx.Sucursal
TRHistSaldosCx.Sucursal=TRHistSaldosCx.CentroCosto
TRHistSaldosCx.CentroCosto=TRHistSaldosCx.UltimoCambio
TRHistSaldosCx.UltimoCambio=(Fin)

[Lista.ListaOrden]
(Inicio)=TRHistSaldosCx.FechaEmision	(Decendente)
TRHistSaldosCx.FechaEmision	(Decendente)=TRHistSaldosCx.MovID	(Acendente)
TRHistSaldosCx.MovID	(Acendente)=TRHistSaldosCx.IDOrigen	(Acendente)
TRHistSaldosCx.IDOrigen	(Acendente)=TRHistSaldosCx.Mov	(Acendente)
TRHistSaldosCx.Mov	(Acendente)=(Fin)

[Lista.FiltroListaEstatus]
(Inicio)=(Todos)
(Todos)=PENDIENTE
PENDIENTE=CONCLUIDO
CONCLUIDO=(Fin)

[Forma.ListaAcciones]
(Inicio)=Cerrar
Cerrar=Excel
Excel=Personalizar
Personalizar=Fecha
Fecha=CentroCosto
CentroCosto=Movimiento
Movimiento=CuentasContables
CuentasContables=Actualizar
Actualizar=Navegacion
Navegacion=(Fin)
