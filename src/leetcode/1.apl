⍝ https://leetcode.com/problems/two-sum/

⍝ direct array approach, target p array
p ← {r←⍵⍳⍵∩⍺-⍵ ⋄ 2=≢r:r ⋄ r/⍨⍺≠2×⍵[r]}
