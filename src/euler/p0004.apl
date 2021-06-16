⍝ Find the largest palindrome that is the product of two three digit numbers.
⍝ Both solutions below use outer product to multiply all three digit numbers.

⍝ One liner checking for palindromes by converting to/from strings with a reversal.
⌈/{((⊢=(⍎∘⌽∘⍕¨))⍵)/⍵}∪∊(⊣∘.×⊢)99+⍳900

⍝ Significantly faster:
⍝   - Organize values into classes by digits
⍝   - decode, reverse, and encode each class and compress by equality
⍝   - combine results together for each class, report max
p ← {⍵/⍨⍵=(⍺⍴10)⊥⊖(⍺⍴10)⊤⍵}
m ← {s←{⍵[⍋⍵]}∪∊⍵∘.×⍵ ⋄ d←⌈10⍟1+s ⋄ ⌈/⊃,/{(⊃⍵)p(2⊃⍵)}¨↓[1]↑(∪d)((1,2≢/d)⊂s)}
m 99+⍳900

⍝ Same as above, but now using key
p ← {⍵/⍨⍵=(⍺⍴10)⊥⊖(⍺⍴10)⊤⍵}
m ← {s←{⍵[⍋⍵]}∪∊⍵∘.×⍵ ⋄ d←⌈10⍟1+s ⋄ ⌈/⊃,/{(⊃⍵)p(2⊃⍵)}¨↓{⍵[⍋⍵;]}⊖d{⍺ ⍵}⌸s}
m 99+⍳900
