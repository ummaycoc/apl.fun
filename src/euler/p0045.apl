⍝ second triangular/pentagonal/hexagonal number
t ← {+\⍵}
p ← {0.5×-⍵-3×⍵*2}
h ← {-⍵-2×⍵*2}
i ← {⊃∩/(t⍵)(p⍵)(h⍵)}
i⍳100000

⍝ via recursion and fixed point operator
c ← {(0.5 ¯0.5 ¯1)×⍵+(1 ¯3 ¯2)×(⍵*2)}
n ← {r←c ⍵ ⋄ 1=≢∪r:⍵ ⋄ ⍵+r=⌊/r}
⊃c{r←(n⍣≡)⍵ ⋄ r[1]≤285:∇r+1 0 0 ⋄ r}1 1 1

⍝ via just fixed point operator
c ← {(0.5 ¯0.5 ¯1)×⍵+(1 ¯3 ¯2)×(⍵*2)}
n ← {r←c ⍵ ⋄ 1≠≢∪r:⍵+r=⌊/r ⋄ ⍵+⍺≥⍵}
⊃c 143(n⍣≡)1 1 1
