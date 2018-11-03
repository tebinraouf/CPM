# Critical Path Method
An application to find the Critical Path of a project

### Assumptions
1. First line is the header
2. The input is comma separated
3. The input should be in the following format order: ```TaskName,Duration,Predecessor```
4. If there are more than one predecessor, separate them with a comma such as ```B,2,C,D,E```
5. If a task doesn't have any predecessors, it should be labeled NA



### Samples

1. [8-tasks example](sample8.md)

#### Sample 01 Input
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
#### Sample 01 Output

