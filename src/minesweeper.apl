⍝ Minesweeper grid generation
⍝ Example:
⍝         99 play 16 30 1 1
⍝   xx2*2x1****2*3*21**2*1x112*2*2
⍝   xx3*3x13**4314*4233321x1*2133*
⍝   x13*31x123*1x2*4*21*1xx111x1*3
⍝   x1*3*1x113231213*2222xxxxxx12*
⍝   x1133311*2*3*212211*1x11211x11
⍝   2212**112323*22*42211x1*2*211x
⍝   **12*42x1*11112***1xxx11212*21
⍝   22112*22332x1233321xxxxxx123*2
⍝   xx1233*2**2x2**321xxxxxxx1*23*
⍝   xx1**2124*3x2*4**311xx1222113*
⍝   xx1232214*412123*4*2xx1**2113*
⍝   xxx12*3*4*4*1xx113*2x1234*32*2
⍝   xxx1*23*32*21xxxx23323*45*4*32
⍝   x11212221111x111x1**3*****312*
⍝   x2*2x1*1x11113*2x124*5*4321x11
⍝   x2*2x111x1*11**2xxx2*311xxxxxx

place ← { ⍝ r c place mines...
  a←,⍵∘.+,¯2+⍳3 3  ⍝ mines and squares around them
  c←⍉{⍺,⍕≢⍵}⌸a/⍨∧⌿(1,1,-⍺)(≤⍤0 1)⍉(⊢,-)↑a  ⍝ counts within valid squares
  m←⍺⍴'x' ⋄ m[1⌷c]←2⌷c ⋄ m[⍵]←'*' ⋄ m  ⍝ minesweep map
}
mines ← {⍺↑((⊂(≢?≢))⌷⊣),⍳⍵}  ⍝ ⍺ random mines in ⍵ grid
start ← {⍵∊⍨⊂⍺:⍵~⊂⍺ ⋄ ¯1↓⍵}  ⍝ drop ⍺ mine or last of ⍵ if not found
play ← {⍵[1 2] place ⍵[3 4] start (⍺+1) mines ⍵[1 2]} ⍝ n play r c x y
