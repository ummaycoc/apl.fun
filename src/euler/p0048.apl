⍝ last ten digits of sum n^n from 1 to 1000
m ← {A C B D←1E5|(⌊1E5÷⍨⍺ ⍵),⍺,⍵ ⋄ 1E10|(1E5×1E5|A B+.×D C)+(B×D)}
e ← {⍺≤0:1 ⋄ ⍺=1:⍵ ⋄ 1=2|⍺:1E10|⍵m(⍺-1)∇⍵ ⋄ (⍺÷2)∇⍵m⍵}
a ← {1E10|+/1E10|⍺⍵}
(⊢a.e⊣)⍳1000
