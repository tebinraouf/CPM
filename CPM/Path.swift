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
/// This class generates paths and task attributes from a `Graph` object
public class Path {
    ///A holder for all paths
    private var _allPaths = [[TaskNode]]()
    
    ///A holder for all tasks in a path
    private var _paths = [TaskNode]()
    
    ///A graph representing all tasks
    private var graph: Graph
    
    ///All generated paths. Task attributes (such as ES, EF, LS, LF, Slack, isOnCriticalPath) are not calculated
    public var paths: [[TaskNode]] {
        return _allPaths
    }
    
    ///Labeled Paths - Critical and None Paths
    public var labeledPaths = Dictionary<PathType, Dictionary<Int, [[TaskNode]]>>()
    
    ///All critical paths. Task attributes are calculated
    public var criticalPaths = Dictionary<Int, [[TaskNode]]>()
    
    ///Number of paths in a graph
    public var count: Int {
        return paths.count
    }
    
    ///Initialize the Path with a graph
    ///
    /// - Parameter graph: the graph from which pathes are generated
    public init(_ graph: Graph) {
        self.graph = graph
    }
    
    ///Generate all paths and calculate all attributes
    public func generate() {
        //1. Generate all paths without attributes. `paths` is populated
        initialPathsGenerator()
        //2. Isolate Paths into `PathType` (Critical or None). `labeledPaths` property is populated
        isolatePaths()
        //3. Calculate Critical Path tasks' attributes. `criticalPaths` property is populated. `labeledPaths` property is updated.
        calculateCPAttributes()
        //4. Calculate None Critical Path tasks' attributes.
        calculateNoneCPAttributes()
    }
    
    ///Generate paths from a graph
    ///
    private func initialPathsGenerator() {
        let startTask = graph.getTask(by: "Start")
        if startTask != nil {
            getPaths(graph, source: startTask!)
            _allPaths = remove(task: startTask!, allPaths: _allPaths)
        } else {
            //TODO: This should be fixed. The first task might not be the start task
            getPaths(graph, source: graph.tasks.first!)
        }
    }
    
    ///Remove a task in a collection of paths of tasks
    ///
    /// - parameter task: The task to be removed
    /// - parameter allPaths: the collection from which the task is removed
    /// - Returns: the new collection without the task which is an array of paths of tasks.
    private func remove(task: TaskNode, allPaths: [[TaskNode]]) -> [[TaskNode]]{
        var updatedAllPaths = [[TaskNode]]()
        for path in allPaths {
            var p = path
            if (path.contains(task)) {
                p.removeAll { $0 == task }
            }
            updatedAllPaths.append(p)
        }
        return updatedAllPaths
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


///Critical Path Extension
///1. Calculate Critical Path Attributes
///2. Isolate Paths into `PathType`
extension Path {
    ///Calculate Early Start (ES), Early Finish (EF), Late Start (LS), Late Finish (LF), and Slack for tasks on critical paths
    ///
    /// - Returns: Void
    private func calculateCPAttributes() {
        let _criticalPath = labeledPaths[PathType.Critical]!
        //_ is the key which is the duration of the critical path
        for (_ ,cPaths) in _criticalPath {
            //early start
            for path in cPaths {
                var earlyFinish = 0
                for task in path {
                    //early start and early finish
                    task.earlyStart = earlyFinish + 1
                    task.earlyFinish = task.duration + task.earlyStart - 1
                    earlyFinish = task.earlyFinish
                    
                    //late start and late finish
                    //for tasks on critical path LS = ES and LF = EF
                    task.lateStart = task.earlyStart
                    task.lateFinish = task.earlyFinish
                    
                    //Slack for tasks on CP is 0
                    task.slack = 0
                    
                    //The task is on the CP
                    task.isOnCriticalPath = true
                    
                    //Set the isEarlySet and isLateSet for later use
                    task.isEarlySet = true
                    task.isLateSet = true
                }
            }
        }
        //Update labeled Paths
        labeledPaths[PathType.Critical] = _criticalPath
        //Store `criticalPath` separately
        criticalPaths = _criticalPath
    }
    
    /// This function isolates all the paths into `PathType`. Paths are either Critical or None
    ///
    /// - Returns: A key-value pair. Key is of type `PathType`. Value is a key-value pair. Key is the total duration of the path. Value is an array of paths.
    private func isolatePaths() {
        var mixedPaths = getPathsWithDuration()
        
        //Get Critical Paths
        let key = mixedPaths.keys.max()!
        var criticalPaths = Dictionary<Int, [[TaskNode]]>()
        criticalPaths[key] = mixedPaths[key]
        
        //Get None Critical Paths
        //Remove critical path from paths
        mixedPaths.removeValue(forKey: key)
        let noneCriticalPaths = mixedPaths
        
        labeledPaths[PathType.Critical] = criticalPaths
        labeledPaths[PathType.None] = noneCriticalPaths
    }
    
    /// This function calculates the total duration of each path
    ///
    /// - Returns: A key-value pair. The key is the total duration and the value is any number of paths.
    private func getPathsWithDuration() -> Dictionary<Int, [[TaskNode]]>{
        var dictionary = Dictionary<Int, [[TaskNode]]>()
        for path in paths {
            var pathsWithSameDuration = [[TaskNode]]()
            if dictionary[path.duration] == nil {
                pathsWithSameDuration.append(path)
                dictionary[path.duration] = pathsWithSameDuration
            } else {
                var current = dictionary[path.duration]
                current?.append(path)
                dictionary[path.duration] = current!
            }
        }
        return dictionary
    }
}

extension Path {
    private func calculateNoneCPAttributes() {
        let _noneCPPaths = labeledPaths[PathType.None]!
        
        
        //First Calculate only tasks with one predecessor
        //_ is the key, which is the total duration for the path
        for (_,_paths) in _noneCPPaths {
            for _path in _paths {
                for task in _path {
                    if !task.isOnCriticalPath {
                        //If there are more predecessors, then we need to skip it for later. We calculate ES and EF one level at a time
                        if task.predecessors.count == 1 {
                            //ES and EF
                            let earlyFinish = task.predecessors.earlyFinish
                            task.earlyStart = earlyFinish + 1
                            task.earlyFinish = task.earlyStart + task.duration - 1
                            task.isEarlySet = true
                            print(task)
                        }
                    }
                }
            }
        }
        
        //Calculate ES and EF for tasks with more than one predecessors
        for (_,_paths) in _noneCPPaths {
            for _path in _paths {
                for task in _path {
                    if !task.isOnCriticalPath {
                        if task.predecessors.count > 1 && !task.isEarlySet {
                            print(task)
                            let earlyFinish = task.predecessors.largestEarlyFinish
                            task.earlyStart = earlyFinish + 1
                            task.earlyFinish = task.earlyStart + task.duration - 1
                            task.isEarlySet = true
                            print(task)
                        }
                    }
                }
            }
        }
        
        
    }
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




////the task has no successor, get the last task on the critical path
//if task.successors.count == 0 {
//    //                            //Force-Unwrap is okay because there is always a CP and a task on CP
//    //                            let lastTaskCP = (criticalPaths.values.first!.first!.last)!
//    //                            let lateStart = lastTaskCP.lateStart
//    //
//}
