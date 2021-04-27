
⍝ Return the sum of the even fibonacci numbers less than a given value.
f ← { ⍝ max sum f a b ; f max to start
  1=≢⍵:(⍵,0)f 0 1
  c←+/⍵
  c>⍺[1]:⍺[2]
  (⍺+c×0,2|1+c)∇1↓⍵,c
}
