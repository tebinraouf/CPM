//
//  TaskNode.swift
//  CPM
//
//  Created by Tebin on 10/1/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

import Foundation
/// - Author: Tebin Raouf
///
///The class to represent a task in the Critical Path Application
public class TaskNode: NSObject {
    ///The name of the TaskNode
    public var name: String
    
    ///The duration of the TaskNode
    public var duration: Int
    
    ///Indicate if a TaskNode is visitted in a Graph structure or other linked structures
    public var isVisitted: Bool
    
    ///The TaskNode successors
    public var successors: [Edge]
    
    ///The TaskNode predecessors
    public var predecessors: [Edge]
    
    ///The TaskNode last start
    public var lateStart: Int
    
    ///The TaskNode early start
    public var earlyStart: Int
    
    ///The TaskNode last finish
    public var lateFinish: Int
    
    ///The TaskNode early finish
    public var earlyFinish: Int
    
    
    ///The description of the task is the name of the task
    public override var description: String {
        return name
    }
    
    ///Initialize a TaskNode
    ///
    /// - Parameter name: the name of the TaskNode
    /// - Parameter duration: the duration of the TaskNode
    ///
    ///####Initial Values include:
    ///1. `successors` = empty
    ///2. `predecessors` = empty
    ///3. `isVisitted` = false
    ///4.  `lateStart`, `lateFinish`, `earlyStart`, `earlyFinish` =  -1
    public init(name: String, duration: Int) {
        self.name = name
        self.duration = duration
        successors = []
        predecessors = []
        isVisitted = false
        lateStart = -1
        lateFinish = -1
        earlyStart = -1
        earlyFinish = -1
    }
}
///Compare if two TaskNode (TaskNode objects) are equal
///
///TaskNode A is equal to TaskNode B is their names, successors, and predecessors are equal
///
/// - Parameter lhs: TaskNode object one
/// - Parameter rhs: TaskNode Object two
/// - Returns: true if the two edges are equal; false otherwise
public func == (_ lhs: TaskNode, rhs: TaskNode) -> Bool {
    return lhs.name == rhs.name && lhs.successors == rhs.successors && lhs.predecessors == rhs.predecessors
}
