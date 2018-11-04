#  26 Tasks

#### Input

```
#Task,Duration,Dependencieus
A,1,na
B,3,A
C,4,B
D,4,C
E,4,D
F,4,E
G,3,F
H,4,G
I,4,H
J,2,I
K,4,J
L,4,K
M,2,L
N,2,M
O,2,N
P,2,O
Q,2,P
R,2,Q
S,1,R
T,2,S
U,1,T
V,2,U
W,1,V
X,2,W
Y,1,X
Z,2,Y
```


#### Output

```
["#Task,Duration,Dependencieus", "A,1,na", "B,3,A", "C,4,B", "D,4,C", "E,4,D", "F,4,E", "G,3,F", "H,4,G", "I,4,H", "J,2,I", "K,4,J", "L,4,K", "M,2,L", "N,2,M", "O,2,N", "P,2,O", "Q,2,P", "R,2,Q", "S,1,R", "T,2,S", "U,1,T", "V,2,U", "W,1,V", "X,2,W", "Y,1,X", "Z,2,Y"]
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  Critical Paths & Tasks on Each Path ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
==========There is 1 path with a total duration of 65. Here are the details:==========
Path 1 sequence is: [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z]. There are 26 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 1 LS: 1 LF: 1 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [B]

Name: B => ES: 2 EF: 4 LS: 2 LF: 4 Slack: 0 Is On Critical Path: true Predecessors: [A] Successors: [C]

Name: C => ES: 5 EF: 8 LS: 5 LF: 8 Slack: 0 Is On Critical Path: true Predecessors: [B] Successors: [D]

Name: D => ES: 9 EF: 12 LS: 9 LF: 12 Slack: 0 Is On Critical Path: true Predecessors: [C] Successors: [E]

Name: E => ES: 13 EF: 16 LS: 13 LF: 16 Slack: 0 Is On Critical Path: true Predecessors: [D] Successors: [F]

Name: F => ES: 17 EF: 20 LS: 17 LF: 20 Slack: 0 Is On Critical Path: true Predecessors: [E] Successors: [G]

Name: G => ES: 21 EF: 23 LS: 21 LF: 23 Slack: 0 Is On Critical Path: true Predecessors: [F] Successors: [H]

Name: H => ES: 24 EF: 27 LS: 24 LF: 27 Slack: 0 Is On Critical Path: true Predecessors: [G] Successors: [I]

Name: I => ES: 28 EF: 31 LS: 28 LF: 31 Slack: 0 Is On Critical Path: true Predecessors: [H] Successors: [J]

Name: J => ES: 32 EF: 33 LS: 32 LF: 33 Slack: 0 Is On Critical Path: true Predecessors: [I] Successors: [K]

Name: K => ES: 34 EF: 37 LS: 34 LF: 37 Slack: 0 Is On Critical Path: true Predecessors: [J] Successors: [L]

Name: L => ES: 38 EF: 41 LS: 38 LF: 41 Slack: 0 Is On Critical Path: true Predecessors: [K] Successors: [M]

Name: M => ES: 42 EF: 43 LS: 42 LF: 43 Slack: 0 Is On Critical Path: true Predecessors: [L] Successors: [N]

Name: N => ES: 44 EF: 45 LS: 44 LF: 45 Slack: 0 Is On Critical Path: true Predecessors: [M] Successors: [O]

Name: O => ES: 46 EF: 47 LS: 46 LF: 47 Slack: 0 Is On Critical Path: true Predecessors: [N] Successors: [P]

Name: P => ES: 48 EF: 49 LS: 48 LF: 49 Slack: 0 Is On Critical Path: true Predecessors: [O] Successors: [Q]

Name: Q => ES: 50 EF: 51 LS: 50 LF: 51 Slack: 0 Is On Critical Path: true Predecessors: [P] Successors: [R]

Name: R => ES: 52 EF: 53 LS: 52 LF: 53 Slack: 0 Is On Critical Path: true Predecessors: [Q] Successors: [S]

Name: S => ES: 54 EF: 54 LS: 54 LF: 54 Slack: 0 Is On Critical Path: true Predecessors: [R] Successors: [T]

Name: T => ES: 55 EF: 56 LS: 55 LF: 56 Slack: 0 Is On Critical Path: true Predecessors: [S] Successors: [U]

Name: U => ES: 57 EF: 57 LS: 57 LF: 57 Slack: 0 Is On Critical Path: true Predecessors: [T] Successors: [V]

Name: V => ES: 58 EF: 59 LS: 58 LF: 59 Slack: 0 Is On Critical Path: true Predecessors: [U] Successors: [W]

Name: W => ES: 60 EF: 60 LS: 60 LF: 60 Slack: 0 Is On Critical Path: true Predecessors: [V] Successors: [X]

Name: X => ES: 61 EF: 62 LS: 61 LF: 62 Slack: 0 Is On Critical Path: true Predecessors: [W] Successors: [Y]

Name: Y => ES: 63 EF: 63 LS: 63 LF: 63 Slack: 0 Is On Critical Path: true Predecessors: [X] Successors: [Z]

Name: Z => ES: 64 EF: 65 LS: 64 LF: 65 Slack: 0 Is On Critical Path: true Predecessors: [Y] Successors: []
----------------------------------------------------------------------------------------------------
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ None Critical Paths & Tasks on Each Path ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Project Summary ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Project Duration: 65
All Critical Paths are: 
1. [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z]
```