⍝ Index of the first 1000 digit fibonacci number
)COPY DFNS nats
a ← {n d←⍵ ⋄ (n+1),⊂1↓d,+nats/d}
s ← {1000≤≢2 2⊃⍺}
(a⍣s)1,⊂(,'0')(,'1')
