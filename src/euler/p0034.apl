⍝ Sum of all numbers that equal the sum of the factorial of their digits
⍝ 1! and 2! do not count, as they are not sums.
d ← {(⌈10⍟1+⍵){⍺ ⍵}⌸⍵}  ⍝ key by number of digits
s ← {d v←⍵ ⋄ +/v/⍨v=+⌿!(d⍴10)⊤v}  ⍝ digits, values → sum where property holds for these values
+/s¨↓d 2+⍳+/!7⍴9  ⍝ answer, anything after seven digits will be too big
