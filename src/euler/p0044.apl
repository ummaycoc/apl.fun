⍝ pentagonal numbers with pentogonal sums & differences
c ← {0.5×-⍵-3×⍵*2}
r ← {⍵∊⍨(⊢∘.⍺⍺⊣)⍵}
f ← {m←(+r⍵)∧(-r⍵) ⋄ ~1∊m:0 ⋄ ⍵⌷⍨⍸m}
|-/f c⍳2500  ⍝ earliest pair is right
⍝ sum happens at 2395th element in sequence.
