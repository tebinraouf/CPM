//
//  Edge.swift
//  CPM
//
//  Created by Tebin on 10/1/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

import Foundation

public class Edge: Equatable {
    public var neighbor: TaskNode
    
    public init(_ neighbor: TaskNode) {
        self.neighbor = neighbor
    }
}

public func == (_ lhs: Edge, rhs: Edge) -> Bool {
    return lhs.neighbor == rhs.neighbor
}
