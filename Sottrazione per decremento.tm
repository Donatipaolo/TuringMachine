# Stato iniziale: vai al separatore $
(0, [^], Start, [^], -)
(Start, $, VaiAFineB, $, >)

# Vai alla fine del secondo numero (B)
(VaiAFineB, [^], VaiAFineB, [^], >)
(VaiAFineB, -, CheckBZero, -, <)

# Controlla se B è finito
(CheckBZero, 0, CheckBZero, 0, <)
(CheckBZero, $, Pulizia, -, >)      # B = 0 → fine
(CheckBZero, [1..9], DecrementaB, [1..9], -)

# ----------------------
# DECREMENTO DI B
# ----------------------

(DecrementaB, [1..9], DopoDecrementoB, [0..8], <)
(DecrementaB, 0, PrestitoB, 9, <)

(PrestitoB, [1..9], DopoDecrementoB, [0..8], <)
(PrestitoB, 0, PrestitoB, 9, <)
(PrestitoB, $, Negativo, $, >)   # B > A → risultato negativo

# Dopo aver decrementato B, vai verso A
(DopoDecrementoB, [0..9], DopoDecrementoB, [0..9], <)
(DopoDecrementoB, $, DecrementaA, $, <)

# ----------------------
# DECREMENTO DI A
# ----------------------

(DecrementaA, [1..9], TornaADestra, [0..8], >)
(DecrementaA, 0, PrestitoA, 9, <)

(PrestitoA, [1..9], TornaADestra, [0..8], >)
(PrestitoA, 0, PrestitoA, 9, <)
(PrestitoA, -, Negativo, -, >)

# Torna verso destra per continuare il ciclo
(TornaADestra, [0..9], TornaADestra, [0..9], >)
(TornaADestra, $, VaiAFineB, $, >)

# ----------------------
# CASO NEGATIVO
# ----------------------

(Negativo, [0..9], Negativo, -, >)
(Negativo, $, Negativo, -, >)
(Negativo, -, Fine, -, -)

# ----------------------
# PULIZIA FINALE
# ----------------------

(Pulizia, [0..9], Pulizia, [0..9], >)
(Pulizia, -, Fine, -, -)