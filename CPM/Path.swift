//
//  Path.swift
//  CPM
//
//  Created by Tebin on 10/8/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

import Foundation

/// - Author: Tebin Raouf
///
///
public class Path {
    ///A holder for all paths
    private var _allPaths = [[TaskNode]]()
    
    ///A holder for all tasks in a path
    private var _paths = [TaskNode]()
    
    ///A graph representing all tasks
    private var graph: Graph
    
    ///All generated paths
    public var paths: [[TaskNode]] {
        return _allPaths
    }
    
    ///Number of paths in the graph
    public var count: Int {
        return paths.count
    }
    
    ///Initialize the Path with a graph
    ///
    /// - Parameter graph: the graph from which pathes are generated
    public init(_ graph: Graph) {
        self.graph = graph
    }
    
    ///Generate paths from a graph
    ///
    /// - Returns: An array of paths, which is an array of `TaskNode`s
    public func generate() -> [[TaskNode]] {
        let startTask = graph.getTask(by: "Start")
        if startTask != nil {
            getPaths(graph, source: startTask!)
        } else {
            //TODO: This should be fixed. The first task might not be the start task
            getPaths(graph, source: graph.tasks.first!)
        }
        return paths
    }
    
    
    ///Search the graph by using Depth-First Search Algorithm to find all paths
    ///
    /// This method adds each path to `_allPaths` array
    /// - parameter graph: the graph to be searched for paths
    /// - parameter source: the starting point (TaskNode) of the search
    /// - Returns: void
    private func getPaths(_ graph: Graph, source: TaskNode) {
        _paths.append(source)
        source.isVisitted = true
        
        for edge in source.successors {
            if !edge.neighbor.isVisitted  {
                getPaths(graph, source: edge.neighbor)
            }
        }
        source.isVisitted = false
        if source.successors.count == 0 {
            _allPaths.append(_paths)
        }
        else {
            source.isVisitted = false
            for edge in source.successors {
                edge.neighbor.isVisitted = false
            }
        }
        //pop the last item. Result is unused.
        let _ = _paths.popLast()
    }
    
    
    
}
