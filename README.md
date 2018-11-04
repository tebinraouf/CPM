# Critical Path Method
An application to find the Critical Path of a project

### Assumptions
1. First line is the header
2. The input is comma separated
3. The input should be in the following format order: ```TaskName,Duration,Predecessor```
4. If there are more than one predecessor, separate them with a comma such as ```B,2,C,D,E```
5. If a task doesn't have any predecessors, it should be labeled NA



### Examples

1. [Basic](basic.html)
2. [Basic - Two Starting Tasks](basic---two-starting-tasks.html)
3. [10 Tasks](10-tasks.html)
4. [26 Tasks](26-tasks.html)
5. [50 Tasks](complex-task.html)

### Program Structure 

There are 5 main classes to generate all the critical and none critical paths of a project. The classes are:
1. `FileObject` class to parse a text file into `TaskNode` objects and generate a `Graph` object.
2. `TaskNode` class represents a task.
3. `Edge` class represents connections between `TaskNode` objects.
4. `Graph` class represents tasks and their relationships in a graph structure using a modified depth-first algorithm.
5. `Path` class generates `TaskNode`'s properties such as `earlyStart`, `earlyFinish`, `lateStart`, `lateFinish`, `slack`, `isOnCriticalPath`.

To parse a text file follow these steps:

```
///1. `FileObject` to parse the input into `TaskNode` objects
let fileObject = FileObject("/Users/Tebin/Desktop/CPM/inputs/veryComplex.txt")

///2. `Graph` generated from `getGraph` method of `FileObject`
let graph = fileObject.getGraph()

///3. `Path` to generate all paths in a `Graph`
let path = Path(graph)
path.generate()

///4. View CPM for critical paths
view(path, for: .Critical)

///5. View CPM for none critical paths
view(path, for: .None)

///6. View the project summary
summary(path)
```
