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

⍝ bounds: tree (cmp b scan) value → bounds-seq
⍝   find the increasing-lower or decreasing-upper
⍝   bounds of subtrees holding a given value, via
⍝   <b⌈ and >b⌊, respectively.
b ← {∪⍵⍵\(⍺ ⍺⍺ ⍵)/⍺}

⍝ preceeds: node p tree → nodes added before node
p ← {⍵↑⍨¯1+⍵⍳⍺}

⍝ search: node s tree... → path from root to node
s ← {n←⍺ p ⍵ ⋄ l←n⍳(n(<b⌈)⍺),(n(>b⌊)⍺) ⋄ n[l[⍋l]],⍺}

⍝ compare: path1 c path2 → |path1| |path1 & path2| |path2|
⍝   where path1 & path2 is their common prefix
c ← {(≢⍺),(+/∧\⊃=/⍺⍵↑¨⍨⌊/≢¨⍺⍵),(≢⍵)}

⍝ distance: node1 node2 d tree... → distance
d ← {~∧/⍺∊⍵:¯1 ⋄ +/1 ¯2 1×(⍺[1]s ⍵)c(⍺[2]s ⍵)}

t ← { ⍝ test: expected t node1 node2 tree...
  w←∊⍵
  f←w[1,2]d 2↓w
  ⍺=f:'Test ',(⍕w[1,2]),' passed'
  'Test ',(⍕w[1,2]),' failed: ',(⍕f),'≠',⍕⍺
}
