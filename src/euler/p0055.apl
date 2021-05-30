⍝ count lychrel numbers under 10K (limit 50 iterations)
)copy DFNS nats
i ← {n v←⍵ ⋄ (n+1)(v+nats⌽v)}
s ← {n v←⍺ ⋄ (n=50)∨(v≡⌽v)}
l ← {50=⊃(i⍣s)0(⍕⍵)}
+/l¨⍳1e4
