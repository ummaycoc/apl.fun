⍝ Calculate number of sundays from start of 1901 to end of 2000
l ← {(0=400|⍵)∨(~0=100|⍵)∧(0=4|⍵)}  ⍝ calcualte leap years in ⍵
f ← {7|¯1+¯1↓+\1,⍵}  ⍝ ⍵ months lengths → offsets of 1st of months
d ← ⍉¯1+12 7⍴⍳7  ⍝ 7 rows, each constant 0..6 in 12 columns
s ← {+/0=7|d+7 12⍴f ⍵}  ⍝ ⍵ months lengths → ≢sundays for jan 1st each day
m ← 31 28 31 30 31 30 31 31 30 31 30 31  ⍝ non-leap-year month lengths
c ← (s m),(s m+2=⍳12)  ⍝ ≢sundays non-leap-year, ≢sundays leap-year
j ← 7|1++\1+¯1↓0,l 1900+⍳100  ⍝ jan 1st for 1901 to 2000
+/c[1+(j+7×l)1900+⍳100]
