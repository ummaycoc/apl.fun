⍝ decode text using cyclic three letter ascii passphrase
r ← {¯1↓⊃'UTF-8'⎕NGET ⍵}
text ← ⍎r path
c ← {3↑1⌷⍉⍵[⍒⌽⍵;]}({⍺,≢⍵}⌸) text  ⍝ three most common values (i.e. spaces)
k ← ¯1⌽c[1+3|¯1+text⍳c]  ⍝ most common values in proper mod-3 positions
d ← {b←8⍴2 ⋄ (b∘⊥)¨≠⌿(b∘⊤)¨↑⍵((≢⍵)⍴32+⍺)}  ⍝ xor-decode: space-key d text
⎕UCS k d text  ⍝ read decoded text
+/k d text  ⍝ answer
