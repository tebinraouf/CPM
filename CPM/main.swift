//
//  main.swift
//  CPM
//
//  Created by Tebin on 9/28/18.
//  Copyright © 2018 Tebin. All rights reserved.
//
import Foundation

class Path {
    public var allPaths = [[TaskNode]]()
    private var paths = [TaskNode]()
    
    
    ///Search the graph by using Depth Search Algorithm to file all paths.
    public func getPaths(_ graph: Graph, source: TaskNode) {
        paths.append(source)
        source.isVisitted = true
        
        for edge in source.successors {
            if !edge.neighbor.isVisitted  {
                getPaths(graph, source: edge.neighbor)
            }
        }
        source.isVisitted = false
        if source.successors.count == 0 {
            allPaths.append(paths)
        }
        else {
            source.isVisitted = false
            for edge in source.successors {
                edge.neighbor.isVisitted = false
            }
        }
        //pop the last item. Result is unused.
        let _ = paths.popLast()
    }
}

/*
 1. Find the crtical path
 2. Set the ES, EF, LS, LF on the nodes on the critical path
 3. Use 2 to set other E*, L*
 */

let fileObject = FileObject("/Users/Tebin/Desktop/CPM/input.txt")
let graph = fileObject.getGraph()

let path = Path()
path.getPaths(graph, source: (graph.tasks.first)!)
print(path.allPaths)
