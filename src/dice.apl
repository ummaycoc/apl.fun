⍝ Calculate the expected values for "selection" in dice rolling
⍝ That is, roll ?d6 and take the highest/lowest

⍝ simplest description; takes lots of memory/time if ⍵>7
M ← {(+/÷≢)⌈/↑,⍳⍵⍴6}
m ← {(+/÷≢)⌊/↑,⍳⍵⍴6}
r ← (m,M)

⍝ direct computation method, constant time/space
sel ← {
  d←(6*⍵-1)-(⍵-1)*⍨⍳5
  n←(6*⍵-1)×+/⍳6
  r←n(+,-)+/(⍳5)×d
  r÷6*⍵
}
