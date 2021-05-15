⍝ first odd composite that is not a prime and twice a square
e ← {c←⍵⍳0 ⋄ (¯2×c=⍳⍺)+⍵+0=c|⍳⍺}  ⍝ seive step
p ← {(⍳⍵)/⍨0≥⍵(e⍣{(≢⍺)≤2×⍺⍳0})1,(¯1+⍵)⍴0}  ⍝ seive first N integers
q ← p 10000
o ← ¯1+2×⍳5000
s ← 2×2*⍨⍳50000
q~⍨o/⍨~∨/s∊⍨o∘.{⍺-⍵}q
