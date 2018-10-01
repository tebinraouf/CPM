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
}
public func == (_ lhs: Graph, rhs: Graph) -> Bool {
    return lhs.tasks == rhs.tasks
}
