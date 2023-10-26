
[Forma]
Clave=TREspecificarCC
Icono=0
Modulos=(Todos)
Nombre=<T>Especificar Cuenta Contable <T>+Info.Modulo
VentanaTipoMarco=Normal
VentanaPosicionInicial=Centrado
VentanaEscCerrar=S
VentanaEstadoInicial=Normal
VentanaColor=Plata
AccionesTamanoBoton=15x5

ListaCarpetas=(Variables)
CarpetaPrincipal=(Variables)
PosicionInicialIzquierda=517
PosicionInicialArriba=294
PosicionInicialAlturaCliente=105
PosicionInicialAncho=331
BarraAcciones=S
AccionesCentro=S
ListaAcciones=(Lista)
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
FichaNombres=Arriba
FichaAlineacion=Izquierda
FichaAlineacionDerecha=S
FichaColorFondo=Plata
CampoColorLetras=Negro
CampoColorFondo=Blanco
ListaEnCaptura=Info.TRCuentaCx
CarpetaVisible=S

[(Variables).Info.TRCuentaCx]
Carpeta=(Variables)
Clave=Info.TRCuentaCx
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

[Acciones.Aceptar.Guardar]
Nombre=Guardar
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
Asignar=Guardar
Guardar=(Fin)

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


[Lista.Columnas]
Concepto=304
Cuenta=124





[Forma.ListaAcciones]
(Inicio)=Aceptar
Aceptar=Cancelar
Cancelar=(Fin)
