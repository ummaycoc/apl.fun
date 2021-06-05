⍝ parse hand: rank table, ace-low range, ace-high range, num suits
ph ← {
  h←'023456789TJQKA'⍳1⊃¨⍵  ⍝ rank wrt ace high
  l←'A23456789TJQK0'⍳1⊃¨⍵  ⍝ rank wrt ace low
  s←≢∪2⊃¨⍵  ⍝ number of suits
  c←h({⍺,≢⍵}⌸)h  ⍝ rank frequency
  m←(c[;2])({⍺ ⍵}⌸)(c[;1])  ⍝ ranks by multiplicity
  e←4 2⍴1 ⍬ 2 ⍬ 3 ⍬ 4 ⍬  ⍝ empty rank table
  f←(↓m),(↓e)  ⍝ combined rank rows
  f←(1⊃¨f)({⍺(⊃,/⍵)}⌸)(2⊃¨f)  ⍝ combined rank table
  t←f[⍋f[;1];]  ⍝ sorted rank table
  (t)((⌈/l)-(⌊/l))((⌈/h)-(⌊/h))(s)
}
all ← {∊2⌷[2]⊃⍵}  ⍝ get all the ranks represented by a parsed hand
ranks ← {⊃⍺ 2⌷1⊃⍵}  ⍝ get the ranks of given multiplicities
suits ← {4⊃⍵}  ⍝ get the number of suits
cmp ← {l←⍺[⍒⍺] ⋄ r←⍵[⍒⍵] ⋄ l≡r:0 ⋄ (1⍳⍨l>r)<(1⍳⍨l<r):¯1 ⋄ 1}

royalFlush ← {(straightFlush⍵)∧(14∊1 ranks ⍵)}
straightFlush ← {(straight⍵)∧(flush⍵)}
fourOfAKind ← {⍬≢4 ranks ⍵}
fullHouse ← {(threeOfAKind⍵)∧(pair⍵)}
flush ← {1=suits ⍵}
straight ← {(5=≢1 ranks ⍵)∧4∊(⊂2 3)⌷⍵}
threeOfAKind ← {⍬≢3 ranks ⍵}
twoPair ← {2=≢2 ranks ⍵}
pair ← {⍬≢2 ranks ⍵}
handVec ← {(royalFlush⍵),(straightFlush⍵),(fourOfAKind⍵),(fullHouse⍵),(flush⍵),(straight⍵),(threeOfAKind⍵),(twoPair⍵),(pair⍵)}

win ← {
  lv←handVec ⍺ ⋄ rv←handVec ⍵ ⋄ (lv⍳1)<(rv⍳1):¯1 ⋄ (lv⍳1)>(rv⍳1):1
  tiePair←{r←(2 ranks ⍺)cmp(2 ranks ⍵) ⋄ 0≠r:r ⋄ (all ⍺)cmp(all ⍵)}
  royalFlush ⍵:0
  straightFlush ⍵:(all ⍺)cmp(all ⍵)
  fourOfAKind ⍵:(4 ranks ⍺)cmp(4 ranks ⍵)
  fullHouse ⍵:(3 ranks ⍺)cmp(3 ranks ⍵)
  flush ⍵:(all ⍺)cmp(all ⍵)
  straight ⍵:(all ⍺)cmp(all ⍵)
  threeOfAKind ⍵:(3 ranks ⍺)cmp(3 ranks ⍵)
  twoPair ⍵:⍺ tiePair ⍵
  pair ⍵:⍺ tiePair ⍵
  (all ⍺)cmp(all ⍵)
}
play ← {c←(' '∘(≠⊆⊢))⍵ ⋄ (ph 5↑c)win(ph 5↓c)}
r ← {¯1↓⊃'UTF-8'⎕NGET ⍵}
l ← {⍵⊆⍨⍵≠⎕UCS 10}
({⍺,≢⍵}⌸)play¨l r path
