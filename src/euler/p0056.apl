⍝ maximum sum of digits of a*b for a,b≤100
)copy DFNS nats
⌈/(+/⍎¨)¨,(⊢∘.(*nats)⊣)⍳100
