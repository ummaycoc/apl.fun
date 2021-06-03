⍝ one millionth lexicographic permutation of digits
⎕IO ← 0
c ← {⍬≡⍵:⍺ ⋄ (⍺⌷⍨⊃⍵),(⍺/⍨(⍳≢⍺)≠⊃⍵)∇1↓⍵}
(10⍴10)⊥(⍳10)c(⌽2+⍳9)⊤¯1+1e6
