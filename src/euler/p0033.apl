⍝ Denominator of product of 'cancelable' fractions
e ← {=/⍵×(⌽⍺)}  ⍝ left and right fractions equal
n ← {⍵/⍨~0∘∊¨⍺|⍵}  ⍝ filter out fractions where num. or dem. divisible by ⍺
u ← {⍵/⍨(≠/¨)⍵}  ⍝ filter out fractions equal to one
t ← {⍵/⍨{3=≢∪,10 10⊤⍵}¨⍵}  ⍝ filter out fractions with more than one duplicate digit
r ← {{d←↓[1]10 10⊤⍵ ⋄ (⊃∩/d)~⍨⊃,/d}¨⍵}  ⍝ reduce a fraction by removing common digit
f ← {⍵/⍨(↑⍵)e(↑r⍵)}  ⍝ filter out fractions that aren't equal to their canceled values
m ← {{⍵÷∨/⍵}⊃×/∪{⍵[⍋⍵]}¨⍵}  ⍝ reduced product of fractions
2⊃m f t u 11 n 10 n 9+,⍳90 90  ⍝ answer
