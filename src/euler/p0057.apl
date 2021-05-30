⍝ continued fraction iterations of 2*÷2
a ← {⍺+nats 2×nats ⍵}
s ← {({m n←¯2↑⍵ ⋄ ⍵,(⊂m a n)}⍣⍵),¨'12'}
f ← {d←1↓⍵ ⋄ n ← 2(+nats)/⍵ ⋄ ↑n d}
+/>⌿≢¨f s 999
