⍝ Sum of amicable numbers below 10000
f ← {s←⌊⍵*0.5 ⋄ l←(0=(⍳s)|⍵)/⍳s ⋄ a←l,⍵÷l ⋄ ∪a[⍋a]}
d ← {+/¯1↓f⍵}
s ← {c←d¨⍳⍵ ⋄ l←1↓(c<⍵)/⍳⍵ ⋄ +/((c[l]≠l)∧(c[c[l]]=l))/l}
s 10000
