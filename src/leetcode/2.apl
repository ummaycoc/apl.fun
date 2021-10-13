⍝ https://leetcode.com/problems/add-two-numbers/

p ← {⍺↑⍵,⍺⍴0}  ⍝ right-pad ⍺ & ⍵ with zeroes to match length
a ← {m←(≢⍺)⌈(≢⍵) ⋄ (m p ⍺)+(m p ⍵)}  ⍝ add two vectors of possibly uneven length (no carry)
s ← {(0,⌊10÷⍨⍵)+(10|⍵),0}  ⍝ one carry iteration
z ← {⍵/⍨~∧\0=⍵}  ⍝ remove leading zero (of reversed vector passed in)
c ← {{⌽z⌽s⍵}⍣≡⍺a⍵}  ⍝ iterate until fixed
