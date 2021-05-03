⍝ Finding longest sequence of primes of n^2 + an + b
⍝ Consider |a|<1000, |b|≤1000, find ab for longest seq.
p ← {⍵<0:∇-⍵ ⋄ (⍵>1)∧~∨/0=(1↓⍳⌊(⍵)*0.5)|⍵}
s ← {m←2×⍺+1 ⋄ a b←⍵ ⋄ r←⍺+¯1+⍳m ⋄ c←p¨b+(a×r)+(r*2) ⋄ 0∊c:¯1+⍺+c⍳0 ⋄ (⍺+m)∇⍵}
a ← ¯1001 + ⍳2001
b ← (p¨⍳1000)/⍳1000
n ← ,a∘.,b
c ← (0∘s)¨n
×/⊃n[c⍳⌈/c]
