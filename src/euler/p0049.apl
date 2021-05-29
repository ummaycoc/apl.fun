⍝ Find arithmetic sequence among 4 digit primes that are
⍝ permutations of each other, concatenate in order
p ← {{⍵/⍨⍵>0}∊⍵}  ⍝ compress for positives
i ← {↑p¨↓(⍳⍵)(×⍤1 1)⍺{⍵⌿⍨⍺=+/⍵}⍉(⍵⍴2)⊤⍳2*⍵}  ⍝ ⍵ choose ⍺ indices
l ← {↓⍵⌷⍨⊂⍺i≢⍵}  ⍝ choices of ⍺ items from ⍵
a ← {∧/2=/2-/⍵}  ⍝ flag arithmetic sequences
t ← {↑⊃,/(3∘l)¨⍵}  ⍝ table of triples chosen from each item in ⍵
k ← {({(4⍴10)⊥⍵[⍋⍵]}⍤1)⍉(4⍴10)⊤⍵}  ⍝ key int by sorted digits
g ← {(k⍵){⊂⍵[⍋⍵]}⌸⍵}  ⍝ group ⍵ by digits in elements
⍝ see primes in primes.apl
p4 ← {⍵/⍨⍵≥1E3}2⊃1E4 primes 2 2  ⍝ four digit primes
⎕PP←12  ⍝ show more digits
+/(1e8 1e4 1e0)(×⍤1 1){⍵⌿⍨a⍵}t∘g p4  ⍝ find sequences, concatenate
