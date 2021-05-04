⍝ Find the first ten digits of the sum of the numbers given by n.
r ← {¯1↓⊃'UTF-8'⎕NGET ⍵}
n ← {⍎¨↑(~⍵=⎕UCS 10)⊆⍵}
a ← {+⌿0 1⌽(0 0),10000 10⊤⍵}
s ← {(10⍴10)⊥10↑{(~∧\0=⍵)/⍵}⌽(a⍣{∧/10>⍺})⌽+⌿⍵}
s n r 'path/to/problem/input'
