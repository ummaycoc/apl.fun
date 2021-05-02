⍝ Sum of all positive ints that are
⍝ not the sum of two abundant numbers.
f ← {s←⌊⍵*0.5 ⋄ l←(0=(⍳s)|⍵)/⍳s ⋄ a←l,⍵÷l ⋄ ∪a[⍋a]}
a ← {((2×⍵)<(+/∘f)¨⍵)/⍵}
s ← {+/⍵~∪,(⊣∘.+⊢)a⍵}  ⍝ ∪, reduces time by half
s ⍳28123
