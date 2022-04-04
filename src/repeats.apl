⍝ Calculate the number of repeated words
⍝ Note that we don't count the first instance of a word.

U ← (1∘(819⌶))  ⍝ convert to uppercase
W ← (⊢⊆⍨∊∘⎕A)  ⍝ extract words from text
R ← {+/¯1+((≢⊢)⌸)W U ⍵}  ⍝ count repeats

⍝ R tacit with atops & composition
R ← (+/(¯1∘+)) ∘ ((≢⊢)⌸) (W U)

⍝ All on one line
R ← (+/(¯1∘+)) ∘ ((≢⊢)⌸) ((⊢⊆⍨∊∘⎕A) (1∘(819⌶)))
