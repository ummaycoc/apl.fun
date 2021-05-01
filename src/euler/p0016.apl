⍝ Sum of 2^1000's digits
)COPY DFNS nats
s ← {+/⍎¨2*nats⍵}
s 1000
