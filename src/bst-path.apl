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

⍝ range adjustment: low high a current target → (low current) or (current high)
a ← {</⍵:⍵[1],⍺[2] ⋄ ⍺[1],⍵[1]}

⍝ recursive-search: tree... r low high tarrget index → path from target to root
⍝   low..high is the range for the subtree being examined
⍝   target is the node we want
⍝   index is where we are in tree...
r ← {
  l h t i←⍵
  ⍺[i]=t:t
  (⍺[i]<l)∨(⍺[i]>h):⍺∇l,h,t,i+1
  (⍺∇(l h a ⍺[i]t),t,i+1),⍺[i]
}

⍝ search: node s tree... → path from root to node
s ← {⌽⍵r(⌊/⍵)(⌈/⍵)⍺1}

⍝ compare: path1 c path2 → |path1| |path1 & path2| |path2|
⍝   where path1 & path2 is their common prefix
c ← {(≢⍺),(+/∧\⊃=/⍺⍵↑¨⍨⌊/≢¨⍺⍵),(≢⍵)}

d ← { ⍝ distance: node1 node2 d tree... → distance
  ~∧/⍺∊⍵:¯1
  +/1 ¯2 1×(⍺[1]s⍵)c(⍺[2]s⍵)
}

t ← { ⍝ test: expected t node1 node2 tree...
  w←∊⍵
  f←w[1,2]d 2↓w
  ⍺=f:'Test ',(⍕w[1,2]),' passed'
  'Test ',(⍕w[1,2]),' failed: ',(⍕f),'≠',⍕⍺
}
