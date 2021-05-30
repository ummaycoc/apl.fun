⍝ find the first number such that ×⍳6 all have the same digits
e ← {d←1+⌊10⍟⍵ ⋄ (10⍴⍨d+1)⊥1,((⊂⍋)⌷⊢)(d⍴10)⊤⍵}  ⍝ encode a number as 1<sorted-digits>
m ← {(⍳6)∘.×((10*⍵)+⍳(-10*⍵)+⌊(10*1+⍵)÷6)}  ⍝ matrix of ⍵-digit ×⍳6 multiples
f ← {n←m⍵ ⋄ l←1⍳⍨∧⌿2=⌿e¨n ⋄ l>2⊃⍴n:∇⍵+1 ⋄ n[;l]}  ⍝ recursively compute answer
f 1  ⍝ answer
