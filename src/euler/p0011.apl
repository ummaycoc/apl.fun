⍝ Find the maximum product of 4 numbers in any direction
r ← {¯1↓⊃'UTF-8'⎕NGET ⍵}
n ← {↑⍎¨(~⍵=⎕UCS 10)⊆⍵}
j ← {∊{1,⍵⍴0}¨¯1+≢¨⍵}
d ← {i←,⍳⍴⍵ ⋄ k←(+/¨i){⊂⍵}⌸i ⋄ (j k)⊂⍵[⊃,/k]}
p ← {⊃,/{4×/⍵}¨{(3<≢¨⍵)/⍵}⍵}
b ← {⌈/(,4×/⍵),(,4×⌿⍵),(p d⍵),(p d⌽⍵)}
b n r 'path/to/problem/input'

⍝ An alternative for j which might seem better but longer
⍝ j ← {n←≢¨⍵ ⋄ (2⍴⍨+/n)⊤+/2*¯1++\n}
