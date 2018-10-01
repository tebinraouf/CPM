//
//  TaskNode.swift
//  CPM
//
//  Created by Tebin on 10/1/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

import Foundation

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
