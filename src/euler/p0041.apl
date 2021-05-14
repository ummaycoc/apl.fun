⍝ largest pandigital prime
p ← {(⍳⍵)(,[⍳2](⊢,⍤1 0~)⍤1)⍣⍵⍉⍪⍬}  ⍝ aplcart.info, permutations of ⍳⍵
f ← {c←∊¯1↑[2]⍵ ⋄ ⍵⌿⍨(c≠5)∧(2|c)}  ⍝ last digit must be non-five odd
n ← {(⍵⍴10)⊥⍉f p⍵}  ⍝ decoded candidates
c ← {~0∊⍵|⍨1+2×⍳⌊0.5×⍵*0.5}  ⍝ check if a number is prime
m ← {{⍵/⍨c¨⍵}n⍵}  ⍝ filter ⍵-pandigital numbers for primes
⌈/∊m¨(⍳9)/⍨0≠3|+\⍳9  ⍵ answer
