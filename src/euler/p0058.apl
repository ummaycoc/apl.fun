⍝ find the side length where frequency of spiral primes is under 10%
⍝ see primes from primes.apl
s ← {⍪1↓↑(2*⍨1+2×⍵)∘+¨↓-(¯1+⍳4)(∘.×)(2×⍵)}  ⍝ get corners of nth layer
f ← {
  P←100 primes 2 2 ⋄ L←⍵
  U←{P∘←(2×⊃P)primes P ⋄ ⍺R⍵}  ⍝ update primes and recurse into R
  Q←{p←2⊃P ⋄ ~0∊⍵|⍨p/⍨p≤⍵*÷2}  ⍝ primality check
  R←{
    pc nc←⍺ ⋄ m←s nc+1  ⍝ prime count, number count, corners
    (2*⍨¯1↑2⊃P)<(1 1)⌷m:⍺U⍵  ⍝ more primes
    up←pc++\+⌿Q¨m ⋄ un←⍵+4  ⍝ counts of primes and numbers
    ∨/L≥up÷un:1+2×1+nc  ⍝ found
    ((⊃⌽up),nc+1)∇⊃⌽un  ⍝ not low enough, recurse
  }
  0 0 R 1
}
f 0.1  ⍝ answer
