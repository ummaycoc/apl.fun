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
⍝   8   48  |     1  | 1 edge from 48 to 8

b ← {∪⍵⍵\(⍺ ⍺⍺ ⍵)/⍺}  ⍝ val (cmp b scan) tree → narrowing bounds (<b⌈ or >b⌊)
p ← {⍵↑⍨¯1+⍵⍳⍺}  ⍝ val p tree → values added before val
s ← {n←⍺p⍵ ⋄ l←n⍳(n<b⌈⍺),(n>b⌊⍺) ⋄ n[l[⍋l]],⍺}  ⍝ val s tree → path to val
c ← {(≢⍺),(+/∧\⊃=/⍺⍵↑¨⍨⌊/≢¨⍺⍵),(≢⍵)}  ⍝ p1 c p2 → |p1| |common-prefix(p1, p2)| |p2|
d ← {~∧/⍺∊⍵:¯1 ⋄ 1 ¯2 1+.×(⍺[1]s ⍵)c(⍺[2]s ⍵)}  ⍝ v1 v2 d tree → v1 to v2 distance

t ← { ⍝ test: expected t node1 node2 tree...
  w←∊⍵
  f←w[1,2]d 2↓w
  ⍺=f:'Test ',(⍕w[1,2]),' passed'
  'Test ',(⍕w[1,2]),' failed: ',(⍕f),'≠',⍕⍺
}

⍝ The tests from the header
tree ← 48 8 57 76 90 12 86 83 99 87 55 20 56
¯1 t 1 8 tree
¯1 t 8 1 tree
¯1 t 1 2 tree
0 t 8 8 tree
2 t 8 20 tree
5 t 56 86 tree
1 t 8 48 tree
