%Base de datos del sistema.

%Aviones peque�os.
aeronave(peque�o,"Cessna").
aeronave(peque�o,"Beechcraft").
aeronave(peque�o,"Embraer Pheno").
%Aviones medianos.
aeronave(mediano,"Boing 717").
aeronave(mediano,"Embraer 190").
aeronave(mediano,"Airbus A220").
%Aviones grandes.
aeronave(grande,"Airbus 340").
aeronave(grande,"Airbus 380").

%Pistas.
pista("P1",peque�o,"Este a Oeste").
pista("P1",peque�o,"Oeste a Este").

pista("P2-1",peque�o,"Este a Oeste").
pista("P2-1",mediano,"Este a Oeste").
pista("P2-1",peque�o,"Oeste a Este").
pista("P2-1",mediano,"Oeste a Este").

pista("P3",peque�o,"Este a Oeste").
pista("P3",mediano,"Este a Oeste").
pista("P3",grande,"Este a Oeste").

pista("P3",peque�o,"Oeste a Este").
pista("P3",mediano,"Oeste a Este").
pista("P3",grande,"Oeste a Este").

%Emergencias.
emergencias("Perdida de motor","Llamar a bomberos").
emergencias("Parto en vuelo","Llamar a m�dico").
emergencias("Paro cardiaco","Llamar a m�dico").
emergencias("Secuestro","Llamar al OIJ y a la Fuerza P�blica").

%Atenci�n de Emergencias.
atenEmergencias("Llamar a bomberos").
atenEmergencias("Llamar a m�dico").
atenEmergencias("Llamar al OIJ y a la Fuerza P�blica").

%Condici�n de Aterrizaje.
condici�n("Viento").
condici�n("Peso").
condici�n("Largo de pista").
condici�n("Velocidad").
condici�n("Distancia").

% -------------------------------------------------------------------------
% Funcion que inicia MayCEy
iniciar_MayCEy:-
    read(T), %IMPORTANTE responder entre comillas
    string_lower(T,X),
    split_string(X," ","",L),
    oracion_inicial(L, []).
   %se hace otro read
   %se ejecuta otra funcion que siga respondiendo, una que se llame darpista o similar, que sea un ciclo


% ------------------------------------------------------------------------
% Oracion inicial en caso de saludo
oracion_inicial(X,Y):-
    saludo(X,Y),
    write("Hola, en que le puedo ayudar?"),
    nl,
    read(T),
    string_lower(T,U),
    split_string(U," ","",L),
    verificarsolicitud(L,[]).

%Gramatica BNF para el la oracion inicial con saludo
saludo --> sin_nom.
sin_nom--> com1,sust. %hola maycey
sin_nom--> com2,com3,sust. %buenos dias/tardes/noches maycey
sin_nom--> com2,com3. %buenos/buenos dias/tardes/noches
sin_nom--> verb,prep,sust. %llamando a maycey

sust--> [W],{sustantivo(W)}.
com1--> [W],{comple1(W)}.
com2--> [W],{comple2(W)}.
com3--> [W],{comple3(W)}.
verb--> [W],{verbo(W)}.
prep--> [W],{prepos(W)}.

%Base de datos para el saludo
sustantivo("maycey").
comple1("hola").
comple2("buenos").
comple3("dias").
comple3("tardes").
comple3("noches").
verbo("llamando").
prepos("a").

% Oracion inicial en caso de emergencia
oracion_inicial(X,Y):- emergencia(X,Y),
    write("Cual es su emergencia?"),
    nl.
%    read(E),
%   split_string(E," ","",L).

%Gramatica BNF para una emergencia
emergencia --> sin_nom.
sin_nom--> help.  %Mayday/mayday
sin_nom--> help,help. %Mayday/mayday Mayday/mayday

help --> [W],{id(W)}.

%Base de datos la oracion inicial en caso de emergencia
id("mayday").

% -------------------------------------------------------------------------------
% Verificacion de la solicitud del usuario
verificarsolicitud(X,Y):-
    solicitud(X,Y),
    write("Por favor identifiquese"),
    nl,
    read(X),
    string_lower(X,A),
    split_string(A," ","",B),
    identificacion(B,[]).

%Gramatica BNF para solicitud de despegue o aterrizaje
solicitud--> sin_v.
sin_v--> verbpres, sust2, prep2, verbinf.
verbpres --> [W],{verboprest(W)}.
sust2--> [W],{sustantivo2(W)}.
prep2--> [W], {preposicion2(W)}.
verbinf--> [W], {verboinf(W)}.

%Base de datos para la identificacion del usuario
verboprest("solicito").
sustantivo2("permiso").
preposicion2("para").
verboinf("aterrizar").
verboinf("despegar").

% ------------------------------------------------------------------------
% Identificacion del usuario en caso de toda la informacion
identificacion(A,B):-
    ident(A,B),
    write("Gracias,�Que tipo de aeronave es?"),
    nl.

%Gramatica BNF para la identificacion del usuario
ident--> identBlock.
identBlock --> tagvuel, numvuel,tagaerol, aeroli, tagmatri, matriaeronave.
               %vuelo: 400,/404, aerolinea: tec-airlines, matricula: {matricula}

tagvuel--> [W], { tagvuelo(W)}.
numvuel--> [W], { numvuelo(W)}.
tagaerol--> [W], { tagaerolinea(W)}.
aeroli--> [W], { aerolinea(W)}.
tagmatri--> [W], { tagmatri(W)}.
matriaeronave--> [W], { matricula(W)}.

%Base de datos para la identificacion del usuario
tagvuelo("vuelo:").
numvuelo("400,").
numvuelo("404,").
tagaerolinea("aerolinea:").
aerolinea("tec-airlines,").
tagmatri("matricula:").
matricula("tango fox lima delta").

% ------------------------------------------------------------------------
%Oracion de despedida
oracion_final(X,Y):-despedida(X,Y).

% Gramatica BNF para la oracion de despedida
despedida-->sin_nom_d.
sin_nom_d--> dcom1.
sin_nom_d--> dcom1,dsust. %adios maycey
sin_nom_d--> dcom2,dcon,dcom3,dsust. %cambio y fuera maycey
sin_nom_d--> dcom2,dcon,dcom3. %cambio y fuera


dsust--> [W],{dsustantivo(W)}.
dcom1--> [W],{dcomple1(W)}.
dcom2--> [W],{dcomple2(W)}.
dcom3--> [W],{dcomple3(W)}.
dcon--> [W],{dcong(W)}.

%Base de datos dela despedida
dsustantivo("mayCEy").
dcomple1("adios").
dcomple2("cambio").
dcomple3("fuera").
dcong("y").
