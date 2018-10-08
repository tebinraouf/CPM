//
//  Graph.swift
//  CPM
//
//  Created by Tebin on 10/1/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

import Foundation
/// - Author: Tebin Raouf
///
///The class to represent a graph
public class Graph: Equatable {
    ///All the tasks in the graph
    public var tasks: [TaskNode]
    
    ///Initialize an empty graph
    ///
    /// `tasks` is empty
    public init() {
        self.tasks = []
    }
    
    ///Add a task to the graph
    /// - Parameter task: the task to be added
    /// - Returns: void
    public func addTask(_ task: TaskNode) {
        tasks.append(task)
    }
    
    ///Add a successor task to the current (source) task. This method adds an `Edge` between the two tasks.
    /// - Parameter source: the task in which a successor is added
    /// - Parameter neighbor: the successor task for the source task
    /// - Returns: void
    public func addSuccessorEdge(_ source: TaskNode, neighbor: TaskNode) {
        let edge = Edge(neighbor)
        source.successors.append(edge)
    }
    
    ///Add a predecessor task to the current (source) task. This method adds an `Edge` between the two tasks.
    /// - Parameter source: the task in which a predecessor is added
    /// - Parameter neighbor: the predecessor task for the source task
    /// - Returns: void
    public func addPredecessorEdge(_ source: TaskNode?, neighbor: TaskNode?) {
        if let s = source, let n = neighbor  {
            let edge = Edge(n)
            s.predecessors.append(edge)
        }
    }
    
    ///Get a task object by its name
    /// - Parameter name: the name of the task
    /// - Returns: a `TaskNode` object (if any)
    public func getTask(by name: String) -> TaskNode? {
        for task in tasks {
            if task.name == name {
                return task
            }
        }
        return nil
    }

}
///Compare if two graphs (graph objects) are equal
///
/// - Parameter lhs: Graph object one
/// - Parameter rhs: Graph Object two
/// - Returns: true if the two graphs are equal; false otherwise
public func == (_ lhs: Graph, rhs: Graph) -> Bool {
    return lhs.tasks == rhs.tasks
}
