#Somma di due numeri

#Trovo il simobolo uguale
(0,[^1..9],0,[^1..9],>)
(0,[1..9],1,[1..9],<)
(1,[^],2,#,-)

#Metto un simbolo di fine
(2,[^-],2,[^-],>)
(2,-,3,/,<)

#Torno al # e inizio la somma
(3,[^#],3,[^#],<)
(3,#,CERCA_+,#,>)

#Se lo trovo inizio ad eseguire la somma
(0,=,CERCA_+,=,-)

#Cerco il simbolo +
(CERCA_+,[^+],CERCA_+,[^+],>)
(CERCA_+,+,CERCA_PRIMON,+,-)

#Se lo trovo prendo il primo numero andando verso sinistra e mi salvo il valore
(CERCA_PRIMON,[^0..9#],CERCA_PRIMON,[^0..9#],<)
(CERCA_PRIMON,[0..9],CERCA_[0..9]_#,-,<)

#Una volta trovato il primo numero lo scrivo dopo il #
(CERCA_[0..9]_#,{^#},CERCA_[0..9]_#,{^#},<)
(CERCA_[0..9]_#,#,SCRIVI_PRIMO_[0..9],#,<)

#Se è finito il primo, provo a copiare il secondo numero
(CERCA_PRIMON, #, Copia_Secondo_Numero_Cerca_/, #, >) 

#RICERCO N R O 
# L'ALGORITMO FA DUE COSE DIVERSE IN BASE A QUALE DELLE DUE CIFRE STIAMO INSERENDO
# -------------------------------------------------------------------------------
# Se stiamo inserendo la cifra del primo numero (quello a sinistra del +) allora:
# - Se troviamo - vuol dire che quello è il primo numero e quindi lo scriviamo
# - Se troviamo N vuol dire che l'operazione precedente non ha portato un resto e quindi scriviamo la cifra sul posto
# - Se troviamo R vuol dire che la somma precedente ha portato ad un resto, e quindi eseguiamo la somma in quella posizione e in caso segnaliamo un ulteriore riporto con una R messa alla sinstra del numero appena calcolato

# -------------------------------------------------------------------------------
# Se stiamo inserendo la cifra del secondo numer (quello alla destra del +) dobbiamo:
# Se troviamo N ci spostiamo a destra ed eseguiamo la somma, in caso di riporto dobbiamo scrivere una R a sinistra
# Se troviamo R ci spostiamo a destra ed eseguiamo la somma, un resto in questo caso non è possibile:
# se ad esempio sommiamo due numeri 99+99 i passaggi sono i seguenti:
# N9#9 +99/
# R8#9 +9 /
# R08#  +9 /
# R98#  +  / -----> 198

#Se il primo numero finisce prima del secondo allora il programma legge copia le cifre rimanenti dal secondo numero (Copia_Secondo_Numero)
#Se il secondo numer finisce prima del secondo allora il programma legge copia tutte le cifre rimanenti dal primo numero (Copia_Primo_Numero)


#Se trovo N scrivo la cifra sul posto
(SCRIVI_PRIMO_[0..9],{^-NR},SCRIVI_PRIMO_[0..9],{^-NR},<)
(SCRIVI_PRIMO_[0..9],-N,SCRIVI_PRIMO_N,[0..9],<)

#Se trovo R mi sposto a destra di uno e scrivo il valore + 1, poi mi sposto a sinistra e scrivo N
#Esegui la somma e scrivi il risultato
(SCRIVI_PRIMO_[0..9],R,SOMMA_PRIMO_NUMERO_[0..9],R,>)
(SOMMA_PRIMO_NUMERO_[0..8],1,SCRIVI_PRIMO_N,[1..9],<)
(SOMMA_PRIMO_NUMERO_9,1,SCRIVI_R_PRIMO,0,<)
(SCRIVI_PRIMO_N,[^],CERCA_/,N,>)

(SCRIVI_R_PRIMO,[^],CERCA_/,R,>)

#Cerco  il carattere di fine/
(CERCA_/,[^/],CERCA_/,[^/],>)
(CERCA_/,/,CERCA_SECONDON,/,<)

#Cerco il secondo numero
(CERCA_SECONDON,[^0..9+],CERCA_SECONDON,[^0..9+],<)
(CERCA_SECONDON,[0..9],CERCA_2_[0..9]_#,-,>)

(CERCA_2_[0..9]_#,{^#},CERCA_2_[0..9]_#,{^#},<)
(CERCA_2_[0..9]_#,#,SCRIVI_SECONDO_[0..9],#,<)

#RICERCO R O -
(SCRIVI_SECONDO_[0..9],{^-RN},SCRIVI_SECONDO_[0..9],{^-RN},<)
(SCRIVI_SECONDO_[0..9],-RN,SOMMA_[0..9],-RN,>)

#Eseguo la Somma
(SOMMA_[0..9],0,Scrivi_N,[0..9],<)
(SOMMA_[0..8],1,Scrivi_N,[1..9],<)
(SOMMA_[0..7],2,Scrivi_N,[2..9],<)
(SOMMA_[0..6],3,Scrivi_N,[3..9],<)
(SOMMA_[0..5],4,Scrivi_N,[4..9],<)
(SOMMA_[0..4],5,Scrivi_N,[5..9],<)
(SOMMA_[0..3],6,Scrivi_N,[6..9],<)
(SOMMA_[0..2],7,Scrivi_N,[7..9],<)
(SOMMA_[0..1],8,Scrivi_N,[8..9],<)

#Scrivi N

(Scrivi_N,R,SCRIVI_N_2,1,>)

(Scrivi_N,-,CERCA_+,N,>)
(Scrivi_N,N,CERCA_+,N,>)

#Somma con riporto
(SOMMA_1,9,SCRIVI_RIPORTO,0,<)
(SOMMA_2,[8..9],SCRIVI_RIPORTO,[0..1],<)
(SOMMA_3,[7..9],SCRIVI_RIPORTO,[0..2],<)
(SOMMA_4,[6..9],SCRIVI_RIPORTO,[0..3],<)
(SOMMA_5,[5..9],SCRIVI_RIPORTO,[0..4],<)
(SOMMA_6,[4..9],SCRIVI_RIPORTO,[0..5],<)
(SOMMA_7,[3..9],SCRIVI_RIPORTO,[0..6],<)
(SOMMA_8,[2..9],SCRIVI_RIPORTO,[0..7],<)
(SOMMA_9,[1..9],SCRIVI_RIPORTO,[0..8],<)

#Scrivo il riporto
(SCRIVI_RIPORTO,[^],SCRIVI_R_+,1,<)
(SCRIVI_R_+,[^],CERCA_+,R,>)

#Finisce il secondo numero prima del primo
(CERCA_SECONDON,+,COPIA_PRIMO_NUMERO,+,<)
(COPIA_PRIMO_NUMERO,[^0..9#],COPIA_PRIMO_NUMERO,[^0..9#],<)
(COPIA_PRIMO_NUMERO,[0..9],SCRIVI_PRIMO_[0..9],-,<)
(COPIA_PRIMO_NUMERO,#,FINE_1,-,-)

#Finisce il primo numero prima del secondo, se trova + vuol dire che il numero e' finito
(Copia_Secondo_Numero_Cerca_/, [^/], Copia_Secondo_Numero_Cerca_/, [^/], >)
(Copia_Secondo_Numero_Cerca_/, /, Copia_Secondo_Numero, /, <)
(Copia_Secondo_Numero, [0..9], Copia_[0..9], -, <)
(Copia_Secondo_Numero, +, Fine_Cerca_#, +, <)
(Copia_Secondo_Numero, -, Copia_Secondo_Numero, -, <)


#va in una -somma- diversa
(Copia_[0..9], {^NR}, Copia_[0..9], {^NR}, <)
(Copia_[0..9], N, SCRIVI_N, [0..9], <)
(Copia_[0..9], R, SCRIVI_SECONDO_[0..9], -, >)
#(tempR_[0..8],  


#Fine secondo numero
(Fine_Cerca_#, [^#], Fine_Cerca_#, [^#], <)
(Fine_Cerca_#, #, FINE_2, -, >)

#Fine
(FINE_{1..2}, [^/], FINE_{1..2}, -, >)
(FINE_{1..2}, /, TROVA_NUMERO_{1..2}, -, -)
(TROVA_NUMERO_{1..2},[^0..9],TROVA_NUMERO_{1..2},[^0..9],<)
(TROVA_NUMERO_{1..2},[0..9],CANCELLARN_{1..2},[0..9],<)
(CANCELLARN_{1..2},[^RN-],CANCELLARN_{1..2},[^RN-],<)
(CANCELLARN_{1..2},-,FINESOMMA,-,<)
(CANCELLARN_1,[RN],FINESOMMA,[1-],-)
(CANCELLARN_2,[RN],FINESOMMA,-,-)
