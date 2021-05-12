⍝ sum of numbers that are decimal *and* binary palindromes
l ← {(⌈⍺⍟1+⍵){⍺ ⍵}⌸⍵}  ⍝ key ⍵ by ⍺-length
b ← {(⍺⍴⍨1⊃⍵)⊤2⊃⍵}  ⍝ encode ⍵ (⍺-length, values) in base ⍺
p ← {⍵/⍨∧⌿⍵=⊖⍵}  ⍝ filter ⍵ for palindromes (w/i column)
e ← {⍵⊥⍨⍺⍴⍨⊃⍴⍵}  ⍝ decode ⍵ using base ⍺
f ← {∊(⍺∘e∘p∘(⍺∘b))¨↓⍺l⍵}  ⍝ filter ⍵ for base ⍺ palindromes
+/2 f 10 f ⍳10*6  ⍝ answer
