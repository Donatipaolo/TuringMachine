(0,[1..6],cercapd_[0..5],-,>)
(cercapd_[0..6],{^.P},cercapd_[0..6],{^.P},>)
(cercapd_[0..6],.,cercaps_[0..6],.,>)
(cercapd_[0..6],P,muovipd_[0..6],#,>)

(cercaps_[0..6],{^:P},cercaps_[0..6],{^:P},>)
(cercaps_[0..6],:,cercapd_[0..6],:,>)
(cercaps_[0..6],P,muovips_[0..6],#,<)

#movimento
#verso destra, leggi . vai a :, sposta verso sinistra
(muovipd_[1..6],{#LS},muovipd_[0..5],{#LS},>)
(muovipd_[0..6],.,cerca:d_[0..6],.,>)
(cerca:d_[0..6],{^:},cerca:d_[0..6],{^:},>)
(cerca:d_[0..6],:,muovips_[0..6],:,<)


#verso sinistra, leggi ., vai a : sposta verso destra
(muovips_[1..6],{#LS},muovips_[0..5],{#LS},<)
(muovips_[1..6],.,cerca:s_[1..6],.,>)
(cerca:s_[0..6],{^:},cerca:s_[0..6],{^:},>)
(cerca:s_[0..6],:,muovipd_[0..6],:,>)

#stato fine conta, leggi # (L)adder (S)nake Vuoto

# #-> fine
(muovip[ds]_0, #, Fine, P, -)

# Ladder contolla sotto (sposta 7 verso sinistra)

(muovip[ds]_0, L, Check_L_5, P, <)

(Check_L_[1..5], {^.:},Check_L_[0..4], {^.:},<)
(Check_L_[0..5], {.:},Check_L_[0..5], {.:},<)

(Check_L_0, L, fine, L,-)
(Check_L_0,[^L],move_L_Pc,[^L],>)
(move_L_pc,[^P],move_L_pc,[^P],>)
(move_L_pc,P,move_L_5,L,>)
(move_L_[1..5], {^.:},move_L_[0..4], {^.:},>)
(move_L_[0..5], {.:},move_L_[0..5], {.:},>)

(move_L_0,L,move_L_5,L,>)
(move_L_0,[^L],write_L_5,[^L],<)

(write_L_[1..5], {^.:},write_L_[0..4], {^.:},<)
(write_L_[0..5], {.:},write_L_[0..5], {.:},<)

(write_L_0,[^], fine, P, -)

# Snake controlla sopra (sposta 7 verso destra)

(muovip[ds]_0, S, Check_S_5, P, >)

(Check_S_[1..5], {^.:},Check_S_[0..4], {^.:},>)
(Check_S_[0..5], {.:},Check_S_[0..5], {.:},>)

(Check_s_0, s, fine, s,-)
(Check_s_0,[^s],move_s_Pc,[^s],<)
(move_s_pc,[^P],move_s_pc,[^P],<)
(move_s_pc,P,move_s_5,s,<)
(move_s_[1..5], {^.:},move_s_[0..4], {^.:},<)
(move_s_[0..5], {.:},move_s_[0..5], {.:},<)

(move_s_0,s,move_s_5,s,<)
(move_s_0,[^s],write_s_5,[^s],>)

(write_s_[1..5], {^.:},write_s_[0..4], {^.:},>)
(write_s_[0..5], {.:},write_s_[0..5], {.:},>)

(write_s_0,[^], fine, P, -)

#vuoto win
(muovipd_[0..6], -, win_clean, -, <)
(win_clean, [^-], win_clean, -, <)
(win_clean, -, wr_i, w, >)

(wr_[in], -, wr_[n0], [in], >)