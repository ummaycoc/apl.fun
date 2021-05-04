⍝ Find the maximum product of 13 consecutive digits.
)COPY DFNS nats
r ← {¯1↓⊃'UTF-8'⎕NGET ⍵}
n ← {⍎¨⊃,/(~⍵=⎕UCS 10)⊆⍵}
s ← {⊃⌈nats/,13×nats/⍵}
s n r 'path/to/input'
