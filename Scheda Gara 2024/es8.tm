#Formattazione della stringa

(0,01,o,01,<)
(o,-,l,A,>)
(l,01,p,01,>)
(p,.,dividi,.,>)

(shift,-,riformatta_cp,#,<)
#Formattazione della stringa

(dividi,01,shift,01,>)
(shift,[01],shift[01],/,>)
(shift[01],{01},shift{01},[01],>)
(shift[01],-,indietro,[01],<)

(indietro,[^/],indietro,[^/],<)
(indietro,/,dividi,/,>)

(shift,-,riformatta_cp,#,<)
(inizio,[^.&],inizio,[^.&],<)
(inizio,.,riformatta,&,<)

(riformatta_cp,[^.],riformatta_cp,[^.],<)
(riformatta_cp,.,riformatta,.,<)

(riformatta[a..t]cp,{^&},riformatta[a..t]cp,{^&},>)
(riformatta[a..t]cp,&,riformatta[a..t],/,>)

(riformatta,[10],riformatta,[10],<)
(riformatta,[a..t],riformatta[a..t],[b..t0],>)
(riformatta[a..t],./,riformatta[a..t],..,>)

(riformatta[a..t],{10},riformatta[0a..s],{10},>)
(riformatta0,./,riformatta_cp,&,<)
(riformatta[a..t0],-,inizio_distretto,-,<)
(inizio,[^.&],inizio,[^.&],<)
(inizio,.,riformatta,&,<)

(riformatta_cp,[^.],riformatta_cp,[^.],<)
(riformatta_cp,.,riformatta,.,<)

(riformatta[a..t]cp,{^&},riformatta[a..t]cp,{^&},>)
(riformatta[a..t]cp,&,riformatta[a..t],/,>)

(riformatta,[a..t],riformatta[a..t],[b..t0],>)
(riformatta[a..t],./,riformatta[a..t],..,>)

(riformatta[a..t],{10},riformatta[0a..s],{10},>)
(riformatta0,./,riformatta_cp,&,<)
(riformatta[a..t0],-,inizio_distretto,-,<)