//
//  main.swift
//  CPM
//
//  Created by Tebin on 9/28/18.
//  Copyright © 2018 Tebin. All rights reserved.
//
import Foundation

let fileObject = FileObject("/Users/Tebin/Desktop/CPM/input2.txt")
let graph = fileObject.getGraph()

let path = Path(graph)
path.generate()

//print(path.criticalPaths)
//print(path.labeledPaths)
func view() {
    print("====== None Critical Paths & Tasks on Each Path ======")
    let nonCriticalPaths = (path.labeledPaths[PathType.None])!
    for (totalDuration,paths) in nonCriticalPaths {
        let isAre = paths.count > 1 ? "are" : "is"
        print("There \(isAre) \(paths.count) paths with a total duration of \(totalDuration). Here are the details:")
        var count = 1
        for path in paths {
            var view1 = "Path \(count) sequence is: "
            view1 += "["
            for task in path {
                view1 += task.name + ","
            }
            view1.removeLast()
            view1 += "]. The following are the details of each task:"
            print(view1)
            
            for task in path {
                print("\nName: \(task.name) ES: \(task.earlyStart) EF: \(task.earlyFinish) LS: \(task.lateStart) LF: \(task.lateFinish) Slack: \(task.slack) Is Critical: \(task.isOnCriticalPath)")
            }
            
            count += 1
            print("--------------------------------------------------------------")
        }
        
        print("==========")
    }

    
    
    
}
view()
