⍝ what number under one million has the longest collatz sequence?
n ← {0=2|⍵:⍵÷2 ⋄ 1+⍵×3}
l ← {⍵>≢c:1+∇n⍵ ⋄ 0≠c[⍵]:c[⍵] ⋄ c[⍵]∘←1+∇n⍵ ⋄ c[⍵]}
m ← l¨⍳1e6
m⍳⌈/m
