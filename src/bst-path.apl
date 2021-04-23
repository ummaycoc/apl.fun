⍝ Binary Search Tree Path Distance
⍝ Given a sequence of elements to be entered into a BST
⍝ Calculate the path length in edges between any two nodes.
⍝ Return -1 if one or both of the nodes are missing.
⍝
⍝ Examples
⍝
⍝ The sequence
⍝   tree ← 48 8 57 76 90 12 86 83 99 87 55 20 56
⍝ produces a tree
⍝
⍝            48
⍝         /      \
⍝       8          57
⍝        \       /    \
⍝         12   55       76
⍝        /       \        \
⍝      20         56       90
⍝                         /  \
⍝                       86    99
⍝                      /  \
⍝                    83    87
⍝
⍝
⍝ Node Node | Result | Remark
⍝ ---------------------------
⍝   1    8  |    -1  | 1 not in tree
⍝   8    1  |    -1  | 1 not in tree
⍝   1    2  |    -1  | 1 nor 2 in tree
⍝   8    8  |     0  | 0 edges from 8 to 8
⍝   8   20  |     2  | 2 edges from 8 to 20
⍝  56   86  |     5  | 5 edges from 56 to 86

a ← {</⍵:⍵[1],⍺[2] ⋄ ⍺[1],⍵[1]}

r ← {
  l h t i←⍵
  ⍺[i]=t:t
  (⍺[i]<l)∨(⍺[i]>h):⍺∇l,h,t,i+1
  (⍺∇(l h a ⍺[i]t),t,i+1),⍺[i]
}

s ← {⌽⍵r(⌊/⍵)(⌈/⍵)⍺1}

c ← {(≢⍺),(+/∧\⊃=/⍺⍵↑¨⍨⌊/≢¨⍺⍵),(≢⍵)}

d ← {
  ~∧/⍺∊⍵:¯1
  +/1 ¯2 1×(⌽⍺[1]s⍵)c(⌽⍺[2]s⍵)
}

⍝ Calculate distance with: node1 node2 d tree

t ← { ⍝ expected t node1 node2 tree...
  w←∊⍵
  f←w[1,2]d 2↓w
  ⍺=f:'Test ',(⍕w[1,2]),' passed'
  'Test ',(⍕w[1,2]),' failed: ',(⍕f),'≠',⍕⍺
}
