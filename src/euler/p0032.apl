⍝ Sums of c where 'abc' is all 9 digits and a × b = c
n ← {o←{⍵/⍨(≤/)¨⍵}⍵ ⋄ d←+/¨o ⋄ o/⍨(⍺≥¯1+2×d)∧(⍺≤2×d)}  ⍝ Candidate digit lengths
r ← {⍺≥⍵:⍬ ⋄ (¯1+⍺)+⍳(⍵-⍺)}  ⍝ low r high → [low, high)
p ← {⍵/⍨~∨⌿0=⍵⊤⍨⍺⍴10}  ⍝ num-digits p vec → filter zero digit-numbers out of vec
c ← {⍵/⍨⍺=≢¨∪⌿⍵⊤⍨⍺⍴10}  ⍝ num-digits c vec → filter vec to have ⍺ unique digits
u ← {⍵c⍵p(10*¯1+⍵)r(10*⍵)}  ⍝ u num-digits → ⍵-digit numbers without 0 or repeats
a ← {(⌽1,×\⌽1↓10*⌈10⍟1+⍵)+.×⍵}  ⍝ append numbers together: a 1 2 3 → 123
t ← {a⍺,⍵,⍺×⍵}  ⍝ a t b → a, b, a×b all strung together
l ← {⍵/⍨(⍵≥10*¯1+⍺)∧(⍵<10*⍺)}  ⍝ n l vec → filter vec to have ⍺ digits
f ← {∪⍺c⍺p⍺l⍵}  ⍝ filter ⍵ to have ⍺ non-zero and unique digits
s ← {(10*9-+/⍵)|9f,(u 1⊃⍵)∘.t(u 2⊃⍵)}  ⍝ s (a b) → get a×b pandigital products
+/∪⊃,/s¨9n,⍳9 9  ⍝ Answer
