⍝ Dot product of sum of character positions vs. alphabetical position
r ← {¯1↓⊃'UTF-8'⎕NGET ⍵}  ⍝ Dyalog read UTF-8 file, contents, drop EOLN.
s ← {w←(0,2≢/⍵≠'"')⊂⍵ ⋄ (~w∊(,'"')(,','))/w}
v ← {(+/⎕A∘⍳)¨⍵[⍋⍵]}
d ← {⍵+.×⍳≢⍵}
d v s r '/path/to/names/file'
