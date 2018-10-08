//
//  Graph.swift
//  CPM
//
//  Created by Tebin on 10/1/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

import Foundation

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
    public func getTask(by name: String) -> TaskNode? {
        for task in tasks {
            if task.name! == name {
                return task
            }
        }
        return nil
    }
    public func addEdgePredecessor(_ source: TaskNode?, neighbor: TaskNode?) {
        if let s = source, let n = neighbor  {
            let edge = Edge(n)
            s.predecessors.append(edge)
        }
    }
}
public func == (_ lhs: Graph, rhs: Graph) -> Bool {
    return lhs.tasks == rhs.tasks
}
