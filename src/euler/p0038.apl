⍝ pan-digital multiples
t ← {(⍳⍵)∘.×(⍳9)}  ⍝ times table for first ⍵ numbers and 1 through 9
d ← {+\⌈10⍟1+⍵}  ⍝ scan of number of digits of input
r ← {⍵⌿⍨{∨/⍵∊9}d⍵}  ⍝ remove rows where we don't get to 9 digits
m ← {⍵×9≥d⍵}  ⍝ mask out multiples that would add more than 9 digits
c ← {+/⍵×10*¯1⌽{⍵×⍵≠9}(⍵≠0)×(d ⍵)}  ⍝ concatenate digits together (note ⌽)
e ← {⍵⊤⍨9⍴10}  ⍝ encode numbers into digits
z ← {⍵/⍨~∨⌿0=⍵}  ⍝ remove columns where a zero digit appears
p ← {⍵/⍨9=≢¨∪⌿⍵}  ⍝ remove columns where nine digits are not used
n ← {⍵⊥⍨9⍴10}  ⍝ decode digits as number
⌈/n p z e {c⌽⍵} m r t 9999  ⍝ answer
