⍝ Bulls & Cows
⍝ Computer guesses a four digit number with unique digits
⍝   e.g. 0 1 2 3 or 7 5 0 3
⍝ Computer guess is kept secret
⍝ User repeatedly prompted to guess the number
⍝ 'x' shown for each used digit is in the correct position
⍝ 'o' shown for each used digit not in a correct position
⍝ Game ends when user guesses all four digits in order.
⍝
⍝ Example:
⍝   Computer secret: 7 5 0 3
⍝   ------------------------
⍝   Guess   | Out  | Remark
⍝   0 1 2 3 | xo   | 0 is an o, 3 is an x
⍝   4 5 6 7 | xo   | 7 is an o, 5 is an x
⍝   1 1 1 1 |      | No matches at all.
⍝   0 0 0 0 | x    | No o's, x's counted first.
⍝   7 5 3 0 | xxoo | 7 & 5 are x's, 3 & 0 are o's
⍝   7 5 0 3 | xxxx | All correct

s ← 'Please enter a four digit number: '
p ← {x←⍺+.=⍵ ⋄ o←(+/⍺∊⍵)-x ⋄ x o/'xo'}  ⍝ convert guess to x's & o's
n ← {⍎¨⍵/⍨⍵∊⎕D}  ⍝ scan string for digits
q ← {⍞←⍵ ⋄ (≢⍵)↓⍞}  ⍝ ask user for input
g ← {1↓{n'1',q s}⍣{5=≢⍺}''}  ⍝ acquire guess from user
w ← {⎕←⍺ ⋄ 4='x'+.=⍺}  ⍝ winning condition
r ← {(4?9)(p∘g)⍣w''}  ⍝ run game: r ⍬ (or r with any argument)
