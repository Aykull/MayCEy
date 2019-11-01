%Base de datos del sistema.

%Aviones pequeños.
aeronave(pequeño,"Cessna").
aeronave(pequeño,"Beechcraft").
aeronave(pequeño,"Embraer Pheno").
%Aviones medianos.
aeronave(mediano,"Boing 717").
aeronave(mediano,"Embraer 190").
aeronave(mediano,"Airbus A220").
%Aviones grandes.
aeronave(grande,"Airbus 340").
aeronave(grande,"Airbus 380").

%Pistas.
pista("P1",pequeño,"Este a Oeste").
pista("P1",pequeño,"Oeste a Este").

pista("P2-1",pequeño,"Este a Oeste").
pista("P2-1",mediano,"Este a Oeste").
pista("P2-1",pequeño,"Oeste a Este").
pista("P2-1",mediano,"Oeste a Este").

pista("P3",pequeño,"Este a Oeste").
pista("P3",mediano,"Este a Oeste").
pista("P3",grande,"Este a Oeste").

pista("P3",pequeño,"Oeste a Este").
pista("P3",mediano,"Oeste a Este").
pista("P3",grande,"Oeste a Este").

%Emergencias.
emergencias("Perdida de motor","Llamar a bomberos").
emergencias("Parto en vuelo","Llamar a médico").
emergencias("Paro cardiaco","Llamar a médico").
emergencias("Secuestro","Llamar al OIJ y a la Fuerza Pública").

%Atención de Emergencias.
atenEmergencias("Llamar a bomberos").
atenEmergencias("Llamar a médico").
atenEmergencias("Llamar al OIJ y a la Fuerza Pública").

%Condición de Aterrizaje.
condición("Viento").
condición("Peso").
condición("Largo de pista").
condición("Velocidad").
condición("Distancia").

% Analisis de la gramática

oracion_inicial(X,Y):- saludo(X,Y), write("Hola, por favor identifiquese").
saludo --> sin_nom.
sin_nom--> com1,sust. %Hola/hola MayCEy
sin_nom--> com2,com3,sust. %Buenos/buenos dias/tardes/noches MayCEy
sin_nom--> com2,com3. %Buenos/buenos dias/tardes/noches
sin_nom--> verb,prep,sust.

sust--> [W],{sustantivo(W)}.
com1--> [W],{comple1(W)}.
com2--> [W],{comple2(W)}.
com3--> [W],{comple3(W)}.
verb--> [W],{verbo(W)}.
prep--> [W],{prepos(W)}.

%Base de datos para el saludo
sustantivo("MayCEy").
comple1("Hola").
comple1("hola").
comple2("Buenos").
comple2("buenos").
comple3("dias").
comple3("tardes").
comple3("noches").
verbo("llamando").
prepos("a").

oracion_inicial(X,Y):- emergencia(X,Y), write("Cual es su emergencia?").
emergencia --> sin_nom.
sin_nom--> help.  %Mayday
sin_nom--> help,help. %Mayday Mayday
help --> [W],{id(W)}.
id("Mayday").
id("mayday").

iniciar_MayCEy:-
    read(X), %IMPORTANTE responder entre comillas
    split_string(X," ","",L),
    oracion_inicial(L, []).
   %se hace otro read
   %se ejecuta otra funcion que siga respondiendo, una que se llame darpista o similar, que sea un ciclo


consulta:- write("Digite tamano"),read(Tamano),aeronave(Tamano,Nave),write(Nave).
prueba:- read(X), write(X).

%Base de datos de la gramatica
articulo("el").
articulo("la").
%sustantivo("aeronave").
verbo("aterrizar").
verbo("despegar").
