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

% Analisis de la gram�tica

oracion(S0,S):- sintagma_nominal(S0,S1), sintagma_verbal(S1,S).
sintagma_nominal(S0,S):- articulo(S0,S1),sustantivo(S1,S).
sintagma_nominal(S0,S):- sustantivo(S0,S).
sintagma_verbal(S0,S):- verbo(S0,S).
sintagma_verbal(S0,S):- verbo(S0,S1),sintagma_nominal(S1,S).

%Base de datos de la gramatica
articulo([el|S],S).
articulo([la|S],S).
sustantivo([aeronave|S],S).
verbo([aterrizar|S],S).
verbo([despegar|S],S).


iniciar_MayCEy:- read(X), oracion(X,Y), write(Y).

consulta:- write("Digite tamano"),read(Tamano),aeronave(Tamano,Nave),write(Nave).

