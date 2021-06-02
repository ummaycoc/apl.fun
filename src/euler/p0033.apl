⍝ Denominator of product of 'cancelable' fractions
e ← {=/⍵×(⌽⍺)}  ⍝ left and right fractions equal
n ← {⍵/⍨~0∘∊¨⍺|⍵}  ⍝ filter out fractions where num. or dem. divisible by ⍺
u ← {⍵/⍨(≠/¨)⍵}  ⍝ filter out fractions equal to one
t ← {⍵/⍨{3=≢∪,10 10⊤⍵}¨⍵}  ⍝ filter out fractions with more than one duplicate digit
r ← {{d←↓[1]10 10⊤⍵ ⋄ (⊃∩/d)~⍨⊃,/d}¨⍵}  ⍝ reduce a fraction by removing common digit
f ← {⍵/⍨(↑⍵)e(↑r⍵)}  ⍝ filter out fractions that aren't equal to their canceled values
m ← {{⍵÷∨/⍵}⊃×/∪{⍵[⍋⍵]}¨⍵}  ⍝ reduced product of fractions
2⊃m f t u 11 n 10 n 9+,⍳90 90  ⍝ answer

⍝ Matrix version
o ← 2 1 4 3  ⍝ index swap: 1←→2 3←→4
c ← {10 10 10 10⊤{+/(100 1)×⍵}¨⍵}  ⍝ encode items as 4×n matrix (1 row/digit)
l ← {(10 10⊥⍵[1 2;])<(10 10⊥⍵[3 4;])}  ⍝ mask: left number < right number
n ← {~∧⌿0=⍵[2 4;]}  ⍝ mask: non-trivial cases
t ← {12=×⌿↑{≢¨∪⌿⍵}¨(⍵[1 2;])(⍵[3 4;])(⍵)}  ⍝ mask: specific digits cancel
e ← {⍵[⍺[1];]=⍵[⍺[2];]}  ⍝ mask: rows are equal
m ← {=⌿⍵[⍺;]×⊖↑{10 10⊥⍵}¨(⍵[1 2;])(⍵[3 4;])}  ⍝ mask: cross product equality
q ← {d←⍵ ⋄ ⊃∨/{(⍵ e d)∧((o[⍵]) m d)}¨,1 2∘.,3 4}  ⍝ mask: digits cancel and fractions equal
f ← {⍵/⍨⊃∧/(l ⍵)(n ⍵)(t ⍵)(q ⍵)}  ⍝ compress: <, non-trivial, cancelable, equal
b ← {2(2⊃⍴⍵)⍴10 10⊥2(2×2⊃⍴⍵)⍴⍵}  ⍝ encode back to double digits
r ← {{⍵÷∨/⍵}×/⍵}  ⍝ reduce product to lowest terms
r b f c,9+⍳90 90  ⍝ answer
