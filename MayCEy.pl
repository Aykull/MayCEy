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

