⍝ find primes that have, at the same positions, have
⍝ internally the same digit and externally the same digits
⍝ see primes in primes.apl
k ← {(10⍴⍨+/⍺)⊥⍺⌿⍵⊤⍨10⍴⍨≢⍺}  ⍝ mask k values → values with only digits at mask positions
m ← {⍉(⍵⍴2)⊤⍳¯2+2*⍵}  ⍝ all masks except all-1 or all-0 for length ⍵
s ← {⍵/⍨∧⌿2=⌿⍺⌿(10⍴⍨≢⍺)⊤⍵}  ⍝ mask s values → values where mask positions have same digit

⍝ mask t values → filter values to have same digit across mask positions and
⍝   collect values together by ~mask positions via ⌸
t ← {v←⍺s⍵ ⋄ ((~⍺)k v)({⍺⍵}⌸)v}
f ← {(⊂⍵)t⍨¨↓m 1+⌊10⍟⊃⍵}  ⍝ apply every possible mask to values
l ← {  ⍝ find the prime family that has ⍵ members
  ⍵{
     p←(10×⊃⍵)primes⍵
     q←(2⊃p)↓⍨≢2⊃⍵
     g←⊃⍪/f q
     t←g⌿⍨⍺=≢¨g[;2]
     ~0∊⍴t:t
     ⍺∇p
  }10 primes 2 2
}
