bitpool-simulator
=================

Simple Bitcoin mining pool competition simulator. You can set up different pool hash power and strategy to test your ideas.

Example 1. Basic pools (60%, 20%, 10%)
```
C:\Devel\bitcoin-sim>node simulator
{ ticksPerBlock: 10, interval: 10, verbose: false, limit: 1000 }
.......N..E..........A.E......G..........A.......NG..........A.....N..........A...G......G.G..........A...........A...........A...N..........N.....N.......N.....N....N.......N..........N...N..........A........G..........A...........A...........A.......N.......E..........A....N..........A...........A...........A.....N..........A...........A...........A...........A......G.........N.N........N......NE..........A...N....N..........A....N..........A......N..........A.N..........A.........N..........A.N......E.G.N...N..........A.....E....N.....G..........A...G..........A.NG..........A...........A...........A...N.N..N..........A...........A...........A.......N.N.....N......N......N.N..........A...........A...........A...........A..E..........A..E..........A.........E..G........N..N..N....N...E..........A...........A.N....N..........A...........A.....N.E..........N.N.......N......N..........A.........E....NE..N..........A...E..........A...........A.......N..........A..........G........N.........G.N.N..........A.....N..........A....N.....E..........A...........A........N......N..........A....N..........A...........A...........A........G....|||
Pool block chains:
{ A: 'SNEAGANANAGGGAAANNNNNNNNNAGAAANEANAAANAAAAGNNNNANNANANAANAEGNNAENGAGAAAANNNAAANNNNNNAAAAEAEAEGNNNNEANNAANENNNNAENNAEAANAGNGNNANANEAANNANAAAG',
  N: 'SNEAGANANAGGGAAANNNNNNNNNAGAAANEANAAANAAAAGNNNNANNANANAANAEGNNAENGAGAAAANNNAAANNNNNNAAAAEAEAEGNNNNEANNAANENNNNAENNAEAANAGNGNNANANEAANNANAAAG',
  G: 'SNEAGANANAGGGAAANNNNNNNNNAGAAANEANAAANAAAAGNNNNANNANANAANAEGNNAENGAGAAAANNNAAANNNNNNAAAAEAEAEGNNNNEANNAANENNNNAENNAEAANAGNGNNANANEAANNANAAAG',
  E: 'SNEAGANANAGGGAAANNNNNNNNNAGAAANEANAAANAAAAGNNNNANNANANAANAEGNNAENGAGAAAANNNAAANNNNNNAAAAEAEAEGNNNNEANNAANENNNNAENNAEAANAGNGNNANANEAANNANAAAG' }
Winning block chain: [length, contents]
[ 140,
  'SNEAGANANAGGGAAANNNNNNNNNAGAAANEANAAANAAAAGNNNNANNANANAANAEGNNAENGAGAAAANNNAAANNNNNNAAAAEAEAEGNNNNEANNAANENNNNAENNAEAANAGNGNNANANEAANNANAAAG' ]
N ( global 60%) found 58 out of 139 so 41%
G ( global 20%) found 13 out of 139 so 9%
E ( global 12%) found 12 out of 139 so 8%
```

Example 2. Basic pools (20%, 12%) and custom pool "Challenger" (60%)
```
C:\Devel\bitcoin-sim>node simulator
{ ticksPerBlock: 10, interval: 10, verbose: false, limit: 1000 }
..C.........C.......C..........C......C..........A...C.......C..........A......G..........A...........A......C..........A........C..........A...C..C......C..........A....G..........A......C.........C..........A...........A...C..C.C..........A...........A...........A...........A......C..........A......C..........A...........A..........C......C..........A...........A.......G..........A...........A...C.C..........A.......G..........A.......C.C..........A......C.........GE..........A..........C..........C..........A.......E..........A...........A..G..........A...........A........C..........A......C..........A....C...C..........A.C..........A...........A...C...C.....C..........A.......C..........A....G.....C.C..........A...........A..C..........A...........A...........A...........A........C.C.....C.......C....C..........A...........A...........A...........A...........A...........A..........C........C..........A...........A...........A.....C..........A...........A...........A.....C..........A.....C..........A...........A...........A.........C........C..........C........C..........A...........A...........A..........|||
Pool block chains:
{ A: 'SCCCCCCCAGAACCCCCAGCCAACCCAAAACAAACCAAGACCAGCCAGACCAEAAGACCCCAAACCCAAGCCAACAAAACCCCCAAAAAACCAAAAAAAAACCCCAAA',
  C: 'SCCCCCCCAGAACCCCCAGCCAACCCAAAACAAACCAAGACCAGCCAGACCAEAAGACCCCAAACCCAAGCCAACAAAACCCCCAAAAAACCAAAAAAAAACCCCAA',
  G: 'SCCCCCCCAGAACCCCCAGCCAACCCAAAACAAACCAAGACCAGCCAGACCAEAAGACCCCAAACCCAAGCCAACAAAACCCCCAAAAAACCAAAAAAAAACCCCAAA',
  E: 'SCCCCCCCAGAACCCCCAGCCAACCCAAAACAAACCAAGACCAGCCAGACCAEAAGACCCCAAACCCAAGCCAACAAAACCCCCAAAAAACCAAAAAAAAACCCCAAA' }
Winning block chain: [length, contents]
[ 108,
  'SCCCCCCCAGAACCCCCAGCCAACCCAAAACAAACCAAGACCAGCCAGACCAEAAGACCCCAAACCCAAGCCAACAAAACCCCCAAAAAACCAAAAAAAAACCCCAAA' ]
C ( global 60%) found 47 out of 107 so 43%
G ( global 20%) found 7 out of 107 so 6%
E ( global 12%) found 1 out of 107 so 0%
```

Example 3. Verbose mode
```
C:\Devel\bitcoin-sim>node simulator
{ ticksPerBlock: 2, interval: 10, verbose: true, limit: 10 }
tick
tick
C found a block
G checks on new block found by C
E checks on new block found by C
tick
tick
Anonymous found a block
C defies your puny block, A!
G checks on new block found by A
E checks on new block found by A
tick
tick
E found a block
C switches to plan B
G checks on new block found by E
tick
G found a block
C defies your puny block, G!
E checks on new block found by G
tick
tick
Anonymous found a block
C switches to plan B
G checks on new block found by A
E checks on new block found by A
tick
tick
|||
Pool block chains:
{ A: 'SCAEGA', C: 'SCAEGA', G: 'SCAEGAG', E: 'SCAEGA' }
Winning block chain: [length, contents]
[ 7, 'SCAEGAG' ]
C ( global 60%) found 1 out of 6 so 16%
G ( global 20%) found 2 out of 6 so 33%
E ( global 12%) found 1 out of 6 so 16%
```
