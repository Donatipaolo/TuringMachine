#se è 1 la distanza deve essere maggiore o uguale a 9380
#se è 2 la distanza deve essere maggiore o uguale a 4690
#se è 3 allora va sempre bene

(0,[0..9],leggi_[0..9],[0..9],>)
(leggi_[1..9],{0..9},clean_g,.,-)
(leggi_[3..9],.,clean_g,.,-)
(leggi_0,[^],van_b,[^],-)

#Controllo per velocità 1
(leggi_[12],.,conta1,., >)


(conta[1234], {0..9}, conta[2345], {0..9}, >)
(conta[1234],-,clean_b,-, <)
(conta5, -, check, -, <)
(conta[5], [0..9], clean_g, [0..9], -)

(check, [^.],  check, [^.], <)
(check, .,  check_n, ., <)

#check1
(check_n, 1, check+9, 1, >)


(check+[9380], {^}, clean_b, {^}, <)
(check+9, ., check+9, ., >)
(check+9, 9, check+3, 9, >)
(check+3, [3..9], check+[8gggggg], [3..9], >)
(check+8, [89], check+[0g], [89], >)
(check+0, [0..9], check+g, [0..9], >)

(check+g, [^], clean_g, [^], <)

#check2
(check_n, 2, check_4, 2, >)


(check_[4690], {^}, clean_b, {^}, <)
(check_4, ., check_4, ., >)
(check_4, [4..9], check_[6ggggg], [4..9], >)
(check_6, [6..9], check_[9ggg], [6..9], >)
(check_9, [89], check_[0g], [89], >)
(check_0, [0..9], check_g, [0..9], >)

(check_g, [^], clean_g, [^], <)

(clean_[bg], {^-}, clean_[bg], {^-}, <)
(clean_[bg], -, cle_[bg], -, >)

(cle_[bg], {^-}, cle_[bg], -, >)
(cle_[bg], -, [sf], -, >)

([fuga], -, [uga1], [fuga], >)
([stop], -, [top1], [stop], >)