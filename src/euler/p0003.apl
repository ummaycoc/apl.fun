)COPY DFNS nats
f ← {n d←⍵ ⋄ ⍎0=nats d|nats n:(n÷nats d)d ⋄ n(⊃+nats/(d)1(2≠nats d))}
l ← {2⊃(f⍣{⍎1=nats⊃⍺})⍵ 2}
l '600851475143'
