//
//  TaskNode.swift
//  CPM
//
//  Created by Tebin on 10/1/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

import Foundation



/**
    A class that defines an activity.
 
 */
public class TaskNode: NSObject {
    var name: String?
    var duration: Int?
    var isVisitted: Bool
    
    var successors: [Edge]
    var predecessors: [Edge]
    
    public var lateStart: Int? {
        didSet {
            self.lateStart = oldValue
        }
        willSet {
            self.earlyStart = newValue
        }
    }
    public var earlyStart: Int? {
        didSet {
            self.earlyStart = oldValue
        }
        willSet {
            self.earlyStart = newValue
        }
    }
    public var lastFinish: Int? {
        didSet {
            self.lastFinish = oldValue
        }
        willSet {
            self.lastFinish = newValue
        }
    }
    public var earlyFinish: Int? {
        didSet {
            self.earlyFinish = oldValue
        }
        willSet {
            self.earlyFinish = newValue
        }
    }
    
    init(name: String?, duration: Int?) {
        self.name = name
        self.duration = duration
        successors = []
        predecessors = []
        isVisitted = false
    }
    
    public override var description: String {
        return "\(name!)"
    }
}
public func == (_ lhs: TaskNode, rhs: TaskNode) -> Bool {
    return lhs.name == rhs.name && lhs.successors == rhs.successors
}

extension TaskNode {
    
}
