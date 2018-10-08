//
//  main.swift
//  CPM
//
//  Created by Tebin on 9/28/18.
//  Copyright © 2018 Tebin. All rights reserved.
//
import Foundation
/*
 Assumptions
 1. First line is the header
 2. The input is comma separated
 3. The input should be in the following format order:
    TaskName,Duration,Predecessor
 4. If there are more than one predecessor, separate them with a comma such as
    B,2,C,D,E
 5. If a task doesn't have any predecessors, it should be labeled NA
 */


class PathGenerator {
    private var _allPaths = [[TaskNode]]()
    private var _paths = [TaskNode]()
    
    public init(_ graph: Graph) {
        let startTask = graph.getTask(by: "Start")
        if startTask != nil {
            getPaths(graph, source: startTask!)
        } else {
            //This should be fixed. The first task might not be the start task
            getPaths(graph, source: graph.tasks.first!)
        }
    }
    public var paths: [[TaskNode]] {
        return _allPaths
    }
    ///Search the graph by using Depth Search Algorithm to file all paths.
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

/*
 1. Find the crtical path
 2. Set the ES, EF, LS, LF on the nodes on the critical path
 3. Use 2 to set other E*, L*
 */

let fileObject = FileObject("/Users/Tebin/Desktop/CPM/input.txt")
let graph = fileObject.getGraph()

let pathGenarator = PathGenerator(graph)
print(pathGenarator.paths)

