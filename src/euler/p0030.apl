⍝ Sum of numbers that equal the sum of their digits to their fifth powers
⍝ One is excluded as it is not a sum.
n ← ⍳6×9*5  ⍝ 7 digits would be too big
c ← (6⍴10)⊤n
¯1++/(n=+⌿c*5)/n
