//
//  Helper.swift
//  CPM
//
//  Created by Tebin on 10/8/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

import Foundation

/// - Author: Tebin Raouf
///
///An enum to represent a path. A path is either Critical or None
public enum PathType {
    ///A critical path
    case Critical
    
    ///A none-critical path
    case None
}

///A utility function to nicely view Tasks.
///
/// - parameter path: a `Path` object
/// - parameter type: the path type
func view(_ path: Path, for type: PathType) {
    var pattern = String(repeating: "*", count: 150)
    print(pattern)
    print(pattern)
    print(pattern)
    
    pattern = String(repeating: "~", count: 30)
    let label = type == .Critical ? "" : "None"
    print("\(pattern) \(label) Critical Paths & Tasks on Each Path \(pattern)")
    let allPaths = (path.labeledPaths[type])!
    
    for (totalDuration,paths) in allPaths {
        pattern = String(repeating: "=", count: 10)
        print("\(pattern)There \(paths.isOrAre) \(paths.count) path\(paths.sOrNone) with a total duration of \(totalDuration). Here are the details:\(pattern)")
        var count = 1
        for path in paths {
            var view1 = "Path \(count) sequence is: "
            view1 += "["
            
            for task in path {
                view1 += task.name + ","
            }
            view1.removeLast()
            view1 += "]. There \(path.isOrAre) \(path.count) task\(path.sOrNone). The following are the details of each task:"
            print(view1)
            
            for task in path {
                print("\nName: \(task.name) => ES: \(task.earlyStart) EF: \(task.earlyFinish) LS: \(task.lateStart) LF: \(task.lateFinish) Slack: \(task.slack) Is On Critical Path: \(task.isOnCriticalPath) Predecessors: \(task.predecessors) Successors: \(task.successors)")
            }
            
            count += 1
            pattern = String(repeating: "-", count: 100)
            print(pattern)
        }
    }
}
