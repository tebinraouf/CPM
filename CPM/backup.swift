////
////  main.swift
////  CPM
////
////  Created by Tebin on 9/28/18.
////  Copyright © 2018 Tebin. All rights reserved.
////
//
//import Foundation
//
//print("Hello, World!")
//
//public class TaskNode {
//    var name: String?
//    var duration: Int?
//    var successors: [Edge]
//    init() {
//        //empty
//    }
//    init(name: String?, duration: Int?, successors: [TaskNode]?) {
//        self.name = name
//        self.duration = duration
//        successors = []
//    }
//}
//public func == (_ lhs: TaskNode, rhs: TaskNode) -> Bool {
//    return lhs.name == rhs.name && lhs.successors == rhs.successors
//}
////
//var taskG = TaskNode(name: "G", duration: 1, successors: nil)
//var taskF = TaskNode(name: "F", duration: 2, successors: nil)
//var taskE = TaskNode(name: "E", duration: 2, successors: [taskG, taskF])
//var taskC = TaskNode(name: "C", duration: 4, successors: [taskE])
//var taskD = TaskNode(name: "D", duration: 2, successors: [taskE])
//var taskB = TaskNode(name: "B", duration: 3, successors: [taskC, taskD])
//var taskH = TaskNode(name: "H", duration: 5, successors: nil)
//var taskA = TaskNode(name: "A", duration: 2, successors: [taskB, taskH])
//
////var taskD = TaskNode(name: "D", duration: 5, successors: nil)
////var taskH = TaskNode(name: "H", duration: 5, successors: nil)
////var taskB = TaskNode(name: "B", duration: 3, successors: [taskD])
////var taskA = TaskNode(name: "A", duration: 2, successors: [taskB, taskH])
//
//
//
//
//
//func printList(start: TaskNode?, _ isVisisted: inout Bool) {
//    if !isVisisted {
//        print(start?.name ?? -1)
//    }
//    if let successors = start?.successors {
//        isVisisted = false
//        for task in successors {
//            print(task.name ?? -1)
//            var isVisisted = true
//            printList(start: task, &isVisisted)
//        }
//    }
//}
////var isVisisted = false
////printList(start: taskA, &isVisisted)
//
//public class Edge: Equatable {
//    public var neighbor: TaskNode
//
//    public init(_ neighbor: TaskNode) {
//        self.neighbor = neighbor
//    }
//}
//
//public func == (_ lhs: Edge, rhs: Edge) -> Bool {
//    return lhs.neighbor == rhs.neighbor
//}
//
//class Graph {
//    private var tasks: [TaskNode]
//    init() {
//        tasks = []
//    }
//    func addTask(_ task: TaskNode) {
//        tasks.append(task)
//    }
//    func getTasks() -> [TaskNode] {
//        return tasks
//    }
//}
//
//
//var graph = Graph()
//graph.addTask(taskA)
//
//
//
