⍝ second triangular/pentagonal/hexagonal number
t ← {+\⍵}
p ← {0.5×-⍵-3×⍵*2}
h ← {-⍵-2×⍵*2}
i ← {⊃∩/(t⍵)(p⍵)(h⍵)}
i⍳100000
