⍝ product of 10^n'th digits, n for 0 to 6, of Champernowne's constant
⍝ not space efficient, but fast. a more drawn out computation could be
⍝ done with just some slick math
c ← {⍵/⍨' '≠⍵}⍕⍳185185
×/⍎¨c[10*¯1+⍳7]
