(0,[^],#,[^],<)
(#,-,&,#,>)

(&,[^-],&,[^-],>)
(&,-,INIZIO,&,<)

(INIZIO,[^#],INIZIO,[^#],<)
(INIZIO,#,cerca_numero,#,-)

(cerca_numero,[^#],cerca_numero,[^#],>)
(cerca_numero,#,cerca,#,>)
(cerca,[^0..9],cerca,[^0..9],>)
(cerca,[0..9],somma_#_[0..9],-,<)
(cerca,=,sinistra,=,>)
(somma_#_[0..9],{^#},somma_#_[0..9],{^#},<)
(somma_#_[0..9],#,somma[0..9],#,<)

(somma[0..9],-,cerca_numero,[0..9],>)

(somma0,[0..9],cerca_numero,[0..9],>)
(somma1,[0..8],cerca_numero,[1..9],>)
(somma2,[0..7],cerca_numero,[2..9],>)
(somma3,[0..6],cerca_numero,[3..9],>)
(somma4,[0..5],cerca_numero,[4..9],>)
(somma5,[0..4],cerca_numero,[5..9],>)
(somma6,[0..3],cerca_numero,[6..9],>)
(somma7,[0..2],cerca_numero,[7..9],>)
(somma8,[0..1],cerca_numero,[8..9],>)
(somma9,0,cerca_numero,9,>)

#riporto
(somma1,9,riporto,0,<)
(somma2,[8..9],riporto,[0..1],<)
(somma3,[7..9],riporto,[0..2],<)
(somma4,[6..9],riporto,[0..3],<)
(somma5,[5..9],riporto,[0..4],<)
(somma6,[4..9],riporto,[0..5],<)
(somma7,[3..9],riporto,[0..6],<)
(somma8,[2..9],riporto,[0..7],<)
(somma9,[1..9],riporto,[0..8],<)


(riporto,[-0..8],cerca_numero,[11..9],<)
(riporto,9,riporto,0,<)


#eseguo la stessa cosa da sinistra
(sinistra,[^&],sinistra,[^&],>)
(sinistra,&,cerca_numeros,&,-)

(cerca_numeros,[^&],cerca_numeros,[^&],<)
(cerca_numeros,&,cercas,&,<)

(cercas,[^0..9],cercas,[^0..9],<)
(cercas,[0..9],sommas_&_[0..9],-,>)

(sommas_&_[0..9],{^&},sommas_&_[0..9],{^&},>)
(sommas_&_[0..9],&,sommas[0..9],&,>)
(cercas,=,CONFRONTA,=,-)

(sommas[0..9],-,cerca_numeros,[0..9],<)

(sommas0,[0..9],cerca_numeros,[0..9],<)
(sommas1,[0..8],cerca_numeros,[1..9],<)
(sommas2,[0..7],cerca_numeros,[2..9],<)
(sommas3,[0..6],cerca_numeros,[3..9],<)
(sommas4,[0..5],cerca_numeros,[4..9],<)
(sommas5,[0..4],cerca_numeros,[5..9],<)
(sommas6,[0..3],cerca_numeros,[6..9],<)
(sommas7,[0..2],cerca_numeros,[7..9],<)
(sommas8,[0..1],cerca_numeros,[8..9],<)
(sommas9,0,cerca_numeros,9,<)

#riporto
(sommas1,9,riporto,0,>)
(sommas2,[8..9],riportos,[0..1],>)
(sommas3,[7..9],riportos,[0..2],>)
(sommas4,[6..9],riportos,[0..3],>)
(sommas5,[5..9],riportos,[0..4],>)
(sommas6,[4..9],riportos,[0..5],>)
(sommas7,[3..9],riportos,[0..6],>)
(sommas8,[2..9],riportos,[0..7],>)
(sommas9,[1..9],riportos,[0..8],>)


(riportos,[-0..8],cerca_numeros,[11..9],>)
(riportos,9,riporto,0,>)

(Confronta, =, cerca_&, -, >)

(Cerca_&, [^&], Cerca_&, [^&], >)
(Cerca_&, &, Vai_Fondo, &, >)
(Vai_Fondo, [^-], Vai_Fondo, [^-], >)
(Vai_Fondo, -, Sposta, -, <)

(Sposta, &, Confronta, -, <)
(Sposta, [0..9], Sposta_[0..9]_#, -, <)
(Sposta_[0..9]_#, {^#}, Sposta_[0..9]_#, {^#}, <)
(Sposta_[0..9]_#, #, Scrivi_[0..9], #, >)

(Scrivi_[0..9], {+=-}, Cerca_&, [0..9], >)
(Scrivi_[0..9], {^+=-}, Scrivi_[0..9], {^+=-}, >)

(Confronta, [0..9+-], Confronta, [0..9%%], <)

(Confronta, #, confsin, #, <)
(Confsin, [^-], confsin, [^-], <)
(confsin, -, leggi, &, >)

(leggi, [0..9#], controlla_[0..9d]_destra, &, >)

(controlla_[0..9]_destra, {^#}, Controlla_[0..9]_Destra, {^#}, >)
(controlla_[0..9]_destra, #, controlla_[0..9], #, >)

(controlla_[0..9], {0..9.}, cancellab, ., -)

(controlla_[0..9], -, controlla_[0..9], -, >)
(controlla_[0..9], [0..9], vai_&, ., <)
(controlla_[0..9], ., controlla_[0..9], ., >)

(controlla_d_destra, .,controlla_d_destra, ., >) 
(controlla_d_destra, [0..9], cancellab, ., -)
(controlla_d_destra, -, controlla_d_destra, -, >)
(controlla_d_destra, %, cancellag, %, >)




(vai_&, [^&], vai_&, [^&], <)
(vai_&, &, leggi, &, >) 

(cancella[bg], {^-}, cancella[bg], {^-}, <)
(cancella[bg], -, cancella[bg]_1, -, >)

(cancella[bg]_1, {^-}, cancella[bg]_1, -, >)
(cancella[bg]_1, -, scrivi_[ok], [ko], >)
(scrivi_[ok], -, fine, [ok], -) 
