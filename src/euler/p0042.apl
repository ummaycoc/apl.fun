⍝ count words whose ordinal-letter sums are triangular
r ← {¯1↓⊃'UTF-8'⎕NGET ⍵}
p ← {+/¨⍵⊆⍨27≠⍵}
t ← {+\⍳2×1+⌈0.5*⍨⌈/⍵}
c ← {+/⍵∊t⍵}
c p ⎕A ⍳ r path/to/input
