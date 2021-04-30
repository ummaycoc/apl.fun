⍝ First triangular number with >500 factors
f ← {s←⌊⍵*0.5 ⋄ (2×+/0=(⍳s)|⍵)-(⍵=s*2)}
⊃{t n←⍵ ⋄ (t+n)(n+1)}⍣{500<f⊃⍺}(0 0)
