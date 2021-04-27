
⍝ Quick computation without making a big array.
s ← {2÷⍨⍵×1+⍵}
p ← {⍵×s⌊⍺÷⍵}
+/1 1 ¯1 × 999 p 3 5 15

⍝ Direct computation on an array of the given size.
p ← {+/(0=(3|⍳⍵)×(5|⍳⍵))/⍳⍵}
