⍝ https://leetcode.com/problems/final-value-of-variable-after-performing-operations/

⍝ these are all about as fast as each other.
f1 ← +/¯1+2×'+'=2⌷[2]↑
f2 ← (+/⊢-~)'+'=2⌷[2]↑
f3 ← (+/('+'=⊣)-('-'=⊣))2⌷[2]↑
f4 ← +/¯2+'+ -'⍳2⌷[2]↑

⍝ these are a little slower.
s1 ← (+/{⍎⍺,⍕≢⍵}⌸)2⌷[2]↑
s2 ← ≢-(2×¯1+'+'⍳⍨∘((⊂⍒)⌷⊣)2⌷[2]↑)
