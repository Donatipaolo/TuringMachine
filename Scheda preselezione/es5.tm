(0, [^], ciao, [^], <)
(ciao, -, ciao2, ., <)
(ciao2, -, c_p_p, $, >)
#pilota, ing1, ing2, spec, medi, esp)
#P, I,G, S, M ,E

(C_[pIGSME], {a..z}, C_[pIGSME]_p, {a..z}, >)

(c_[pIGSME]_p, {^.#}, c_[pIGSME]_p, {^.#}, >)
(c_[pIGSME]_p, .#, c_[pIGSME], .#, >)
(c_[pigsme]_p,-,bad,-,<)

#DOPO IL PRIMO INGEGNERE VAI A CONTROLLARE IL SECONDO SUBITO DOPO
(INIZIO_[pIGSME]_#, .#, INIZIO_[pIGSME], ##, <)
(INIZIO_[pIGSME], {^$}, INIZIO_[pIGSME], {^$}, <)
(INIZIO_[pIGSME], $, C_[pIGSME]_p, $, >)

(INIZIO_G_#, .#, C_g_P, ##, >)


(c_p, [MS], INIZIO_I_#, [MS], <)
(c_i, [ENS], INIZIO_G_#, [ens], <)
(c_g, [ENS], INIZIO_S_#, [ENS], <)
(c_s, [CEMG],  INIZIO_M_#, [cemg], <)
(c_m, [CGM], INIZIO_e_#, [cgm], <)
(c_e, [ENS], INIZIO_0_#, [ens],<)

(C_[pIGSME], -, bad, -, -)


#good
(INIZIO_0_#,.#,GOOD_$,##,<)
(GOOD_$,[^$],GOOD_$,[^$],<)
(GOOD_$,$,CANCELLA_s,$,>)

#CANCELLAZIONE
(CANCELLA_s,#,skip,.,>)
(CANCELLA_S,.,cancella,-,>)

#skip
(skip,[^-#.],skip,[^-#.],>)
(skip,.#,cancella_s,.#,-)
(skip,-,place_end,-,-)

#CANCELLA
(cancella,[^-#.],cancella,-,>)
(cancella,.#,cancella_s,.#,-)
(cancella,-,place_end,-,-)

#place end
(place_end,-,start,=,-)
(start,[^$],start,[^$],<)
(start,$,copia,$,>)

#copia
(copia,-,copia,-,>)
(copia,[.A..Z],scrivig[.a..z]_=,-,>)
(scrivig[.a..z]_=,{^=},scrivig[.a..z]_=,{^=},>)
(scrivig[.a..z]_=,=,scrivig[.a..z],=,>)
(scrivig[.a..z],{^-},scrivig[.a..z],{^-},>)
(scrivig[.a..z],-,start,[.a..z],<)

(copia,=,clean,-,<)
(clean,[^$],clean,-,<)
(clean,$,clean.,-,>)
(clean.,-,clean.,-,>)
(clean.,.,fine,-,-)


#bad
(bad,[^$],bad,[^$],<)
(bad,$,cancella_bad,-,>)
(cancella_bad,[^-],cancella_bad,-,>)
(cancella_bad,-,scrivir,c,>)
(scrivi[rew.in1ompl2ta],-,scrivi[ew.in1ompl2ta9],[rew.incompleta],>)
(scrivi9,-,fine,-,-)