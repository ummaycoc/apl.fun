⍝ find the prime < 1 million that is the longest sum of consecutive primes
⍝ see primes in primes.apl
q ← 2⊃1E6 primes 2 2  ⍝ primes below 1 million
s ← {⍎((⍕⍵),'+/q')}  ⍝ ⍵-window sum of q
c ← {⍬≢q∩s ⍵}  ⍝ check if ⍵-window sum has any elements in q
b ← +/1E6≥+\q  ⍝ length of largest consecutive sum under 1 million
q∩s((-∘1)⍣{c ⍺})1+b  ⍝ answer
