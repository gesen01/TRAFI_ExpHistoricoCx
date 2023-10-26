
[Forma]
Clave=TRCuentaConceptoCxLista
Icono=0
Modulos=(Todos)
Nombre=<T>Lista de cuentas contables - <T>+Info.Modulo
VentanaTipoMarco=Normal
VentanaPosicionInicial=Centrado
VentanaEscCerrar=S
VentanaEstadoInicial=Normal
VentanaColor=Plata

ListaCarpetas=Lista
CarpetaPrincipal=Lista
BarraHerramientas=S
AccionesTamanoBoton=15x5
AccionesDerecha=S
ListaAcciones=Seleccionar
PosicionInicialIzquierda=446
PosicionInicialArriba=152
PosicionInicialAlturaCliente=389
PosicionInicialAncho=473
[Lista]
Estilo=Hoja
Clave=Lista
BusquedaRapidaControles=S
AlineacionAutomatica=S
AcomodarTexto=S
MostrarConteoRegistros=S
Zona=A1
Vista=Cta
Fuente={Tahoma, 8, Negro, []}
HojaTitulos=S
HojaMostrarColumnas=S
HojaMostrarRenglones=S
HojaColoresPorEstatus=S
HojaPermiteInsertar=S
HojaPermiteEliminar=S
HojaVistaOmision=Automática
HojaColorFondo=Plata
CampoColorLetras=Negro
CampoColorFondo=Blanco

FiltroModificarEstatus=S
FiltroCambiarPeriodo=S
FiltroBuscarEn=S
FiltroFechasCambiar=S
FiltroFechasNormal=S
FiltroFechasNombre=&Fecha
BusquedaRapida=S
BusquedaInicializar=S
BusquedaRespetarControles=S
BusquedaAncho=20
BusquedaEnLinea=S
FuenteBusqueda={MS Sans Serif, 8, Negro, []}
CarpetaVisible=S
Filtros=S

FiltroPredefinido=S
FiltroNullNombre=(sin clasificar)
FiltroEnOrden=S
FiltroTodoNombre=(Todo)
FiltroAncho=20
FiltroRespetar=S
FiltroTipo=General


ListaEnCaptura=Cta.Cuenta
FiltroGeneral={Si(ConDatos(Info.Modulo) y (Info.Modulo=<T>CXC<T>),<T>Cta.Categoria=<T>+Comillas(Info.Modulo),Si(ConDatos(Info.Modulo) y (Info.Modulo=<T>CXP<T>),<T>Cta.Categoria=<T>+Comillas(Info.Modulo),<T>1=1<T>))}
[Acciones.Seleccionar]
Nombre=Seleccionar
Boton=23
NombreEnBoton=S
NombreDesplegar=&Seleccionar
EnBarraHerramientas=S
TipoAccion=Ventana
ClaveAccion=Seleccionar
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

[Lista.Columnas]
Concepto=304
Cuenta=124



[Lista.ListaEnCaptura]
(Inicio)=Concepto.Concepto
Concepto.Concepto=Concepto.Cuenta
Concepto.Cuenta=(Fin)



[Lista.Cta.Cuenta]
Carpeta=Lista
Clave=Cta.Cuenta
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
Tamano=20
ColorFondo=Blanco
