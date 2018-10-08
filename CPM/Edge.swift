//
//  Edge.swift
//  CPM
//
//  Created by Tebin on 10/1/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

import Foundation
/// - Author: Tebin Raouf
///
///The class to link TaskNode objects together
public class Edge: Equatable {
    /// The TaskNode instance for each Edge
    public var neighbor: TaskNode
    /// Initialize an Edge
    ///
    /// - Parameter neighbor: the TasNode object that is a neighbor to a current task
    public init(_ neighbor: TaskNode) {
        self.neighbor = neighbor
    }
}
///Compare if two edges (edge objects) are equal
///
/// - Parameter lhs: Edge object one
/// - Parameter rhs: Edge Object two
/// - Returns: true if the two edges are equal; false otherwise
public func == (_ lhs: Edge, rhs: Edge) -> Bool {
    return lhs.neighbor == rhs.neighbor
}
