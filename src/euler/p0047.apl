⍝ find start of four consecutive numbers with four distinct prime factors
⍝ see primes in primes.apl
s ← {
  N←⍵ ⋄ 2 2{
    p ps←⍺ ⋄ n v←⍵
    v>p÷2:((p+10000) primes ⍺)∇⍵
    c←+/0=v|⍨ps/⍨ps≤v
    N≠c:⍺∇0(v+1)
    N=n+1:1+v-N
    ⍺∇(n+1)(v+1)
  }(N=1)3
}
s 4
