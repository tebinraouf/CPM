#  Basic CPM Example

#### Input
```
#Task,dur,preds
A,2,na
B,3,A
C,4,B
D,2,B
E,2,C,D
F,2,E
G,1,E
H,5,A
```

#### Output

```
["#Task,dur,preds", "A,2,na", "B,3,A", "C,4,B", "D,2,B", "E,2,C,D", "F,2,E", "G,1,E", "H,5,A"]
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  Critical Paths & Tasks on Each Path ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
==========There is 1 path with a total duration of 13. Here are the details:==========
Path 1 sequence is: [A,B,C,E,F]. There are 5 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 2 LS: 1 LF: 2 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [B, H]

Name: B => ES: 3 EF: 5 LS: 3 LF: 5 Slack: 0 Is On Critical Path: true Predecessors: [A] Successors: [C, D]

Name: C => ES: 6 EF: 9 LS: 6 LF: 9 Slack: 0 Is On Critical Path: true Predecessors: [B] Successors: [E]

Name: E => ES: 10 EF: 11 LS: 10 LF: 11 Slack: 0 Is On Critical Path: true Predecessors: [C, D] Successors: [G, F]

Name: F => ES: 12 EF: 13 LS: 12 LF: 13 Slack: 0 Is On Critical Path: true Predecessors: [E] Successors: []
----------------------------------------------------------------------------------------------------
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ None Critical Paths & Tasks on Each Path ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
==========There is 1 path with a total duration of 12. Here are the details:==========
Path 1 sequence is: [A,B,C,E,G]. There are 5 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 2 LS: 1 LF: 2 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [B, H]

Name: B => ES: 3 EF: 5 LS: 3 LF: 5 Slack: 0 Is On Critical Path: true Predecessors: [A] Successors: [C, D]

Name: C => ES: 6 EF: 9 LS: 6 LF: 9 Slack: 0 Is On Critical Path: true Predecessors: [B] Successors: [E]

Name: E => ES: 10 EF: 11 LS: 10 LF: 11 Slack: 0 Is On Critical Path: true Predecessors: [C, D] Successors: [G, F]

Name: G => ES: 12 EF: 12 LS: 13 LF: 13 Slack: 1 Is On Critical Path: false Predecessors: [E] Successors: []
----------------------------------------------------------------------------------------------------
==========There is 1 path with a total duration of 11. Here are the details:==========
Path 1 sequence is: [A,B,D,E,F]. There are 5 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 2 LS: 1 LF: 2 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [B, H]

Name: B => ES: 3 EF: 5 LS: 3 LF: 5 Slack: 0 Is On Critical Path: true Predecessors: [A] Successors: [C, D]

Name: D => ES: 6 EF: 7 LS: 8 LF: 9 Slack: 2 Is On Critical Path: false Predecessors: [B] Successors: [E]

Name: E => ES: 10 EF: 11 LS: 10 LF: 11 Slack: 0 Is On Critical Path: true Predecessors: [C, D] Successors: [G, F]

Name: F => ES: 12 EF: 13 LS: 12 LF: 13 Slack: 0 Is On Critical Path: true Predecessors: [E] Successors: []
----------------------------------------------------------------------------------------------------
==========There is 1 path with a total duration of 7. Here are the details:==========
Path 1 sequence is: [A,H]. There are 2 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 2 LS: 1 LF: 2 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [B, H]

Name: H => ES: 3 EF: 7 LS: 9 LF: 13 Slack: 6 Is On Critical Path: false Predecessors: [A] Successors: []
----------------------------------------------------------------------------------------------------
==========There is 1 path with a total duration of 10. Here are the details:==========
Path 1 sequence is: [A,B,D,E,G]. There are 5 tasks. The following are the details of each task:

Name: A => ES: 1 EF: 2 LS: 1 LF: 2 Slack: 0 Is On Critical Path: true Predecessors: [] Successors: [B, H]

Name: B => ES: 3 EF: 5 LS: 3 LF: 5 Slack: 0 Is On Critical Path: true Predecessors: [A] Successors: [C, D]

Name: D => ES: 6 EF: 7 LS: 8 LF: 9 Slack: 2 Is On Critical Path: false Predecessors: [B] Successors: [E]

Name: E => ES: 10 EF: 11 LS: 10 LF: 11 Slack: 0 Is On Critical Path: true Predecessors: [C, D] Successors: [G, F]

Name: G => ES: 12 EF: 12 LS: 13 LF: 13 Slack: 1 Is On Critical Path: false Predecessors: [E] Successors: []
----------------------------------------------------------------------------------------------------
******************************************************************************************************************************************************
******************************************************************************************************************************************************
******************************************************************************************************************************************************
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Project Summary ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Project Duration: 13
All Critical Paths are: 
1. [A, B, C, E, F]
```