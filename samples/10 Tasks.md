#  10 Tasks

#### Input

```
#Task,dur,preds
A,3,na
B,2,A
C,1,A
D,1,A
E,3,A
F,1,B
G,2,B
H,1,B
I,2,D,F,G,H,E
J,1,I
K,2,J
L,1,K
```

#### Output

```
["#Task,dur,preds", "A,3,na", "B,2,A", "C,1,A", "D,1,A", "E,3,A", "F,1,B", "G,2,B", "H,1,B", "I,2,D,F,G,H,E", "J,1,I", "K,2,J", "L,1,K"]
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  Critical Paths & Tasks on Each Path ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
==========There is 1 path with a total duration of 13. Here are the details:==========
Path 1 sequence is: [A,B,G,I,J,K,L]. There are 7 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 3 LS: 1 LF: 3 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [C, B, D, E]

Name: B => ES: 4 EF: 5 LS: 4 LF: 5 Slack: 0 Is On Critical Path: true Predecessors: [A] Successors: [G, H, F]

Name: G => ES: 6 EF: 7 LS: 6 LF: 7 Slack: 0 Is On Critical Path: true Predecessors: [B] Successors: [I]

Name: I => ES: 8 EF: 9 LS: 8 LF: 9 Slack: 0 Is On Critical Path: true Predecessors: [D, F, G, H, E] Successors: [J]

Name: J => ES: 10 EF: 10 LS: 10 LF: 10 Slack: 0 Is On Critical Path: true Predecessors: [I] Successors: [K]

Name: K => ES: 11 EF: 12 LS: 11 LF: 12 Slack: 0 Is On Critical Path: true Predecessors: [J] Successors: [L]

Name: L => ES: 13 EF: 13 LS: 13 LF: 13 Slack: 0 Is On Critical Path: true Predecessors: [K] Successors: []
----------------------------------------------------------------------------------------------------
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ None Critical Paths & Tasks on Each Path ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
==========There is 1 path with a total duration of 10. Here are the details:==========
Path 1 sequence is: [A,D,I,J,K,L]. There are 6 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 3 LS: 1 LF: 3 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [C, B, D, E]

Name: D => ES: 4 EF: 4 LS: 7 LF: 7 Slack: 3 Is On Critical Path: false Predecessors: [A] Successors: [I]

Name: I => ES: 8 EF: 9 LS: 8 LF: 9 Slack: 0 Is On Critical Path: true Predecessors: [D, F, G, H, E] Successors: [J]

Name: J => ES: 10 EF: 10 LS: 10 LF: 10 Slack: 0 Is On Critical Path: true Predecessors: [I] Successors: [K]

Name: K => ES: 11 EF: 12 LS: 11 LF: 12 Slack: 0 Is On Critical Path: true Predecessors: [J] Successors: [L]

Name: L => ES: 13 EF: 13 LS: 13 LF: 13 Slack: 0 Is On Critical Path: true Predecessors: [K] Successors: []
----------------------------------------------------------------------------------------------------
==========There is 1 path with a total duration of 4. Here are the details:==========
Path 1 sequence is: [A,C]. There are 2 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 3 LS: 1 LF: 3 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [C, B, D, E]

Name: C => ES: 4 EF: 4 LS: 13 LF: 13 Slack: 9 Is On Critical Path: false Predecessors: [A] Successors: []
----------------------------------------------------------------------------------------------------
==========There are 3 paths with a total duration of 12. Here are the details:==========
Path 1 sequence is: [A,B,H,I,J,K,L]. There are 7 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 3 LS: 1 LF: 3 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [C, B, D, E]

Name: B => ES: 4 EF: 5 LS: 4 LF: 5 Slack: 0 Is On Critical Path: true Predecessors: [A] Successors: [G, H, F]

Name: H => ES: 6 EF: 6 LS: 7 LF: 7 Slack: 1 Is On Critical Path: false Predecessors: [B] Successors: [I]

Name: I => ES: 8 EF: 9 LS: 8 LF: 9 Slack: 0 Is On Critical Path: true Predecessors: [D, F, G, H, E] Successors: [J]

Name: J => ES: 10 EF: 10 LS: 10 LF: 10 Slack: 0 Is On Critical Path: true Predecessors: [I] Successors: [K]

Name: K => ES: 11 EF: 12 LS: 11 LF: 12 Slack: 0 Is On Critical Path: true Predecessors: [J] Successors: [L]

Name: L => ES: 13 EF: 13 LS: 13 LF: 13 Slack: 0 Is On Critical Path: true Predecessors: [K] Successors: []
----------------------------------------------------------------------------------------------------
Path 2 sequence is: [A,B,F,I,J,K,L]. There are 7 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 3 LS: 1 LF: 3 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [C, B, D, E]

Name: B => ES: 4 EF: 5 LS: 4 LF: 5 Slack: 0 Is On Critical Path: true Predecessors: [A] Successors: [G, H, F]

Name: F => ES: 6 EF: 6 LS: 7 LF: 7 Slack: 1 Is On Critical Path: false Predecessors: [B] Successors: [I]

Name: I => ES: 8 EF: 9 LS: 8 LF: 9 Slack: 0 Is On Critical Path: true Predecessors: [D, F, G, H, E] Successors: [J]

Name: J => ES: 10 EF: 10 LS: 10 LF: 10 Slack: 0 Is On Critical Path: true Predecessors: [I] Successors: [K]

Name: K => ES: 11 EF: 12 LS: 11 LF: 12 Slack: 0 Is On Critical Path: true Predecessors: [J] Successors: [L]

Name: L => ES: 13 EF: 13 LS: 13 LF: 13 Slack: 0 Is On Critical Path: true Predecessors: [K] Successors: []
----------------------------------------------------------------------------------------------------
Path 3 sequence is: [A,E,I,J,K,L]. There are 6 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 3 LS: 1 LF: 3 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [C, B, D, E]

Name: E => ES: 4 EF: 6 LS: 5 LF: 7 Slack: 1 Is On Critical Path: false Predecessors: [A] Successors: [I]

Name: I => ES: 8 EF: 9 LS: 8 LF: 9 Slack: 0 Is On Critical Path: true Predecessors: [D, F, G, H, E] Successors: [J]

Name: J => ES: 10 EF: 10 LS: 10 LF: 10 Slack: 0 Is On Critical Path: true Predecessors: [I] Successors: [K]

Name: K => ES: 11 EF: 12 LS: 11 LF: 12 Slack: 0 Is On Critical Path: true Predecessors: [J] Successors: [L]

Name: L => ES: 13 EF: 13 LS: 13 LF: 13 Slack: 0 Is On Critical Path: true Predecessors: [K] Successors: []
----------------------------------------------------------------------------------------------------
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Project Summary ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Project Duration: 13
All Critical Paths are: 
1. [A, B, G, I, J, K, L]

```