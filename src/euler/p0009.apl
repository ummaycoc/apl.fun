⍝ Find product of pythagorean triple that sums to 1000.

⍝ Simple one liner.
×/⊃{(p¨⍵)/⍵}∪d¨{({1000>+/⍵}¨⍵)/⍵}∪s¨,(⊣∘.,⊢)⍳998

⍝ Significantly quicker
p ← { ⍝ ⍺p⍵ → (⍳⍵),(⍳⍵),c, a+b+c=⍺ pythagorean pairs
  a←(⍵*2)⍴⍳⍵ ⋄ b←,⍉(⍵ ⍵⍴a) ⋄ c←⍺-(a+b)
  m←3(⍵*2)⍴a,b,c
  y←(c>0)∧0=1 1 ¯1+.×m*2
  f←3(+/y)⍴(y/a),(y/b),(y/c)
  ↑∪{⍵[⍋⍵]}¨↓[1]f
}
×/1000 p 998
