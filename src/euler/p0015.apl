⍝ Lattice paths in an 20 × 20 grid
)COPY DFNS nats
f ← {¯1↑(+nats\⍣⍵)1⍴⍨1+⍵}
f 20
