⍝ Sum along diagonals as numbers spiral from center.
s ← {o←1+2×⍳⍵ ⋄ 1+(4×+/o*2)-6×+/¯1+o}
s 500

⍝ Direct computation w/o array
s ← {oo←¯1+3÷⍨×/⍵,(1+2×⍵),(¯1+2×⍵) ⋄ 1+(4×oo)-×/6,⍵,⍵-1}
s 501
