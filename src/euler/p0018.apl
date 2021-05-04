⍝ Max sum path through the triangle.
r ← {¯1↓⊃'UTF-8'⎕NGET ⍵}
n ← {⍎¨(~⍵=⎕UCS 10)⊆⍵}
f ← {(⍺+1↓⍵)⌈(⍺+¯1↓⍵)}
f/n r 'path/to/problem/input'
