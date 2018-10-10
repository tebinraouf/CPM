//
//  main.swift
//  CPM
//
//  Created by Tebin on 9/28/18.
//  Copyright © 2018 Tebin. All rights reserved.
//
import Foundation


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
        let isAre = paths.count > 1 ? "are" : "is"
        let sOrNot = paths.count > 1 ? "s" : ""
        pattern = String(repeating: "=", count: 10)
        print("\(pattern)There \(isAre) \(paths.count) path\(sOrNot) with a total duration of \(totalDuration). Here are the details:\(pattern)")
        var count = 1
        for path in paths {
            var view1 = "Path \(count) sequence is: "
            view1 += "["
            
            for task in path {
                view1 += task.name + ","
            }
            view1.removeLast()
            view1 += "]. There \(path.isOrAre) \(path.count) task(s). The following are the details of each task:"
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


let fileObject = FileObject("/Users/Tebin/Desktop/CPM/input2.txt")
let graph = fileObject.getGraph()

let path = Path(graph)
path.generate()

view(path, for: .Critical)
view(path, for: .None)

