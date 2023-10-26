
[Forma]
Clave=EspecificarTMMovCxc
Icono=0
Modulos=(Todos)
MovModulo=CXC
Nombre=<T>Especificar Movimiento - <T>+Info.Modulo
VentanaTipoMarco=Normal
VentanaPosicionInicial=Centrado
VentanaEscCerrar=S
VentanaEstadoInicial=Normal
VentanaColor=Plata

ListaCarpetas=(Variables)
AccionesTamanoBoton=15x5
BarraAcciones=S
AccionesCentro=S
AccionesDivision=S
ListaAcciones=(Lista)
CarpetaPrincipal=(Variables)
EsMovimiento=S
TituloAuto=S
MovEspecificos=Todos
PosicionInicialIzquierda=432
PosicionInicialArriba=214
PosicionInicialAlturaCliente=118
PosicionInicialAncho=329
[(Variables)]
Estilo=Ficha
Clave=(Variables)
PermiteEditar=S
AlineacionAutomatica=S
AcomodarTexto=S
MostrarConteoRegistros=S
Zona=A1
Vista=(Variables)
Fuente={Tahoma, 8, Negro, []}
FichaEspacioEntreLineas=6
FichaEspacioNombres=100
FichaEspacioNombresAuto=S
FichaNombres=Izquierda
FichaAlineacion=Izquierda
FichaAlineacionDerecha=S
FichaColorFondo=Plata
CampoColorLetras=Negro
CampoColorFondo=Blanco
ListaEnCaptura=Info.Mov
CarpetaVisible=S

[(Variables).Info.Mov]
Carpeta=(Variables)
Clave=Info.Mov
Editar=S
LineaNueva=S
ValidaNombre=S
3D=S
Tamano=20
ColorFondo=Blanco

[Acciones.Aceptar.Asignar]
Nombre=Asignar
Boton=0
TipoAccion=Controles Captura
ClaveAccion=Variables Asignar
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

[Acciones.Aceptar.Cerrar]
Nombre=Cerrar
Boton=0
TipoAccion=Ventana
ClaveAccion=Aceptar
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

[Acciones.Aceptar]
Nombre=Aceptar
Boton=0
NombreEnBoton=S
NombreDesplegar=&Aceptar
Multiple=S
EnBarraAcciones=S
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
[Acciones.Aceptar.ListaAccionesMultiples]
(Inicio)=Asignar
Asignar=Cerrar
Cerrar=(Fin)

[Acciones.Cancelar]
Nombre=Cancelar
Boton=0
NombreEnBoton=S
NombreDesplegar=&Cancelar
EnBarraAcciones=S
TipoAccion=Ventana
ClaveAccion=Cancelar
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













[Forma.ListaAcciones]
(Inicio)=Aceptar
Aceptar=Cancelar
Cancelar=(Fin)
