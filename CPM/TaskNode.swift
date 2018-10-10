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
    
    ///The TaskNode early start (ES)
    public var earlyStart: Int
    
    ///The TaskNode early finish (EF)
    public var earlyFinish: Int

    ///The TaskNode late start (LS)
    public var lateStart: Int

    ///The TaskNode last finish (LF)
    public var lateFinish: Int
    
    ///The TaskNode slack
    public var slack: Int
    
    ///Indicate if a TaskNode is on a critical path
    public var isOnCriticalPath: Bool
    
    ///Indicate if Early Start and Early Finish are set
    public var isEarlySet: Bool

    ///Indicate if Late Start and Late Finish are set
    public var isLateSet: Bool
    
    ///The description of the task is the name of the task
    public override var description: String {
//        return "\nName: \(name) ES: \(earlyStart) EF: \(earlyFinish) LS: \(lateStart) LF: \(lateFinish) Slack: \(slack) IsCritical: \(isOnCriticalPath)\n\n"
        return name
//        return "Name: \(name) ES: \(earlyStart) EF: \(earlyFinish)"
    }
    
    ///Initialize a TaskNode
    ///
    /// - Parameter name: the name of the TaskNode
    /// - Parameter duration: the duration of the TaskNode
    ///
    ///####Initial Values include:
    ///1. `successors` = empty
    ///2. `predecessors` = empty
    ///3. `isVisitted`, `isOnCriticalPath`, `isEarlySet`, `isLateSet` = false
    ///4.  `lateStart`, `lateFinish`, `earlyStart`, `earlyFinish`, `slack` =  -1
    public init(name: String, duration: Int) {
        self.name = name
        self.duration = duration
        successors = []
        predecessors = []
        lateStart = -1
        lateFinish = -1
        earlyStart = -1
        earlyFinish = -1
        slack = -1
        isVisitted = false
        isOnCriticalPath = false
        isEarlySet = false
        isLateSet = false
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

extension Sequence where Iterator.Element == TaskNode {
    ///Get the total duration per a collection of `TaskNode`
    var duration: Int {
        var totalDuration = 0
        forEach { (task) in
            totalDuration += task.duration
        }
        return totalDuration
    }
}

extension Array where Element: TaskNode {
    var isOrAre: String {
        return count > 1 ? "are" : "is"
    }
}
