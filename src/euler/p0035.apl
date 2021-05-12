⍝ Count circular primes under one million
e ← {c←⍵⍳0 ⋄ (¯2×c=⍳⍺)+⍵+0=c|⍳⍺}  ⍝ seive step
p ← {(⍳⍵)/⍨0≥⍵(e⍣{(≢⍺)≤2×⍺⍳0})1,(¯1+⍵)⍴0}  ⍝ seive first N integers
q ← p 1000  ⍝ primes under one thousand
Q ← q,{⍵/⍨{~0∊q|⍵}¨⍵}1000+⍳999000  ⍝ primes under one million
d ← {(⌈10⍟1+⍵){⍺ ⍵}⌸⍵}  ⍝ organize input by #digits
s ← {n v←⍵ ⋄ n,⊂(n⍴10)⊤v}  ⍝ split input into digits
⍝ filter out even digits or five or when digits sum to multiple of three
f ← {n v←⍵ ⋄ s←+⌿v ⋄ n,⊂v/⍨0≠⊃×/(∧⌿2|v)(∧⌿5|v)(3|s)}
r ← {v←⍵ ⋄ ⍺{(⍺⍴10)⊥⍵⊖v}¨¯1+⍳⍺}  ⍝ get all the rotations
m ← {n v←⍵ ⋄ ⌊⌿↑n r v}  ⍝ get the smallest rotation
c ← {n v←⍵ ⋄ z ← ↑n r v ⋄ z/⍨∧⌿z∊Q}  ⍝ get rotations where all are prime
≢∪∊(c∘s)¨↓d∪2,3,5,∊(m∘f∘s)¨↓d Q  ⍝ answer
