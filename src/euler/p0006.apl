⍝ Find the difference between:
⍝   - square of the sum of the first 100 numbers; and
⍝   - the sum of squares of the first 100 numbers.

⍝ Straight computation
c ← {|(6÷⍨×/⍵(1+⍵)(1+2×⍵))-2*⍨(2÷⍨⍵×(⍵+1))} 
c 100

⍝ Array
a ← {(2*⍨+/⍵)-(+/⍵×⍵)}
a ⍳100
