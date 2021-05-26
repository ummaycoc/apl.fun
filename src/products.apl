⍝ For a given list of integers, at each position find
⍝ the product of every *other* integer in the list.

p ← {¯1↓×\1,⍵}   ⍝ Partial products
c ← {⍵⍵ ⍺⍺ ⍵⍵ ⍵} ⍝ Conjugation operator
m ← (p×(p c ⌽))  ⍝ Missing product
