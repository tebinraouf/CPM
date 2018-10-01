//
//  main.swift
//  CPM
//
//  Created by Tebin on 9/28/18.
//  Copyright © 2018 Tebin. All rights reserved.
//


public class TaskNode: Equatable {
    var name: String?
    var duration: Int?
    var successors: [Edge]
    var isVisitted: Bool

    init(name: String?, duration: Int?) {
        self.name = name
        self.duration = duration
        successors = []
        isVisitted = false
    }
}
public func == (_ lhs: TaskNode, rhs: TaskNode) -> Bool {
    return lhs.name == rhs.name && lhs.successors == rhs.successors
}
public class Edge: Equatable {
    public var neighbor: TaskNode
    
    public init(_ neighbor: TaskNode) {
        self.neighbor = neighbor
    }
}

public func == (_ lhs: Edge, rhs: Edge) -> Bool {
    return lhs.neighbor == rhs.neighbor
}
public class Graph: Equatable {
    public var tasks: [TaskNode]
    
    public init() {
        self.tasks = []
    }
    public func addTask(_ task: TaskNode) {
        tasks.append(task)
    }
    public func addEdge(_ source: TaskNode, neighbor: TaskNode) {
        let edge = Edge(neighbor)
        source.successors.append(edge)
    }
}
public func == (_ lhs: Graph, rhs: Graph) -> Bool {
    return lhs.tasks == rhs.tasks
}

var allPaths = [[TaskNode]]()
var paths = [TaskNode]()

func getPaths(_ graph: Graph, source: TaskNode) {
    paths.append(source)
    source.isVisitted = true
    
    for edge in source.successors {
        if !edge.neighbor.isVisitted  {
            getPaths(graph, source: edge.neighbor)
        }
    }
    source.isVisitted = false
    if source.successors.count == 0 {
        allPaths.append(paths)
    }
    else {
        source.isVisitted = false
        for edge in source.successors {
            edge.neighbor.isVisitted = false
        }
    }
    //pop the last item. Result is unused.
    let _ = paths.popLast()
}



let taskA = TaskNode(name: "A", duration: 2)
let taskB = TaskNode(name: "B", duration: 3)
let taskC = TaskNode(name: "C", duration: 4)
let taskD = TaskNode(name: "D", duration: 2)
let taskE = TaskNode(name: "E", duration: 2)
let taskF = TaskNode(name: "F", duration: 2)
let taskH = TaskNode(name: "H", duration: 5)
let taskG = TaskNode(name: "G", duration: 1)

let graph = Graph()
graph.addTask(taskA)
graph.addTask(taskB)
graph.addTask(taskC)
graph.addTask(taskD)
graph.addTask(taskE)
graph.addTask(taskF)
graph.addTask(taskH)
graph.addTask(taskG)

graph.addEdge(taskA, neighbor: taskB)
graph.addEdge(taskA, neighbor: taskH)
graph.addEdge(taskB, neighbor: taskC)
graph.addEdge(taskB, neighbor: taskD)
graph.addEdge(taskC, neighbor: taskE)
graph.addEdge(taskD, neighbor: taskE)
graph.addEdge(taskE, neighbor: taskF)
graph.addEdge(taskE, neighbor: taskG)

let edges = taskD.successors

//let result = depthFirstSearch(graph, source: taskA)
//
//for node in result {
//    print(node.name)
//}

//print(result)
getPaths(graph, source: taskA)
print("hi...")
