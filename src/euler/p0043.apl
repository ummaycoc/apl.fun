⍝ sum of 0-9 pan-digital numbers with "internal" divisibility
)COPY DFNS nats
p ← {¯1+(⍳⍵)(,[⍳2](⊢,⍤1 0~)⍤1)⍣⍵⍉⍪⍬}  ⍝ aplcart.info, note ¯1+ to ensure 0 is there.
d ← {(↓[1]⌽2(≢⍵)⍴(⍳≢⍵),⍵)}
f ← {⍵⌿⍨0=(2⊃⍺)|(3⍴10)⊥⍉⍵[;¯1+(⊃⍺)+⍳3]}
z ← {⍵⌿⍨0≠⍵[;1]}
r ← {⊃f/⌽(⊂(z⍺)),d⍵}
+nats/(10⍴10)⊥⍉(p 10)r 1 2 3 5 7 11 13 17
