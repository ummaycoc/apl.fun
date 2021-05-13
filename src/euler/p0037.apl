⍝ Find sum of primes that are primes as we truncate left/right
e ← {c←⍵⍳0 ⋄ (¯2×c=⍳⍺)+⍵+0=c|⍳⍺}  ⍝ seive step
p ← {(⍳⍵)/⍨0≥⍵(e⍣{(≢⍺)≤2×⍺⍳0})1,(¯1+⍵)⍴0}  ⍝ seive first N integers
q ← p 1000  ⍝ primes under one thousand
Q ← q,{⍵/⍨{~0∊q|⍵}¨⍵}1000+⍳999000  ⍝ primes under one million
d ← {⌈10⍟1+⍵}  ⍝ number of digits in ⍵
l ← {⌊⍵÷10*¯1+⍳d⍵}  ⍝ truncate to the left
r ← {⍵|⍨10*⍳d⍵}  ⍝ truncate to the right
t ← {∧/⍺∊⍨(l⍵),(r⍵)}  ⍝ ⍺ are known primes, test ⍵ truncations in ⍺
f ← {⍵/⍨(⍵∘t)¨⍵}  ⍝ find truncatable ⍵ wrt ⍵
+/{⍵/⍨10≤⍵}f Q  ⍝ answer
