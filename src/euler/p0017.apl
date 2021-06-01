⍝ count number of characters in words of 1 to 1000
⎕IO ← 0
s ← ≢¨'' 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' 'ten' 'eleven' 'twelve' 'thirteen' 'fourteen' 'fifteen' 'sixteen' 'seventeen' 'eighteen' 'nineteen'
t ← ≢¨'twenty' 'thirty' 'forty' 'fifty' 'sixty' 'seventy' 'eighty' 'ninety'
c ← {
  (⍵>1000)∨(⍵<1):¯1
  ⍵=1000:≢'onethousand'
  ⍵<20:s[⍵]
  ⍵<100:y[⌊⍵÷10]+s[10|⍵]
  0=100|⍵:s[⌊⍵÷100]+≢'hundred'
  +/(∇⍵-100|⍵),3,(∇100|⍵)
}
+/c¨1+⍳1000
