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


/*
 1. Find the crtical path
 2. Set the ES, EF, LS, LF on the nodes on the critical path
 3. Use 2 to set other E*, L*
 */

let fileObject = FileObject("/Users/Tebin/Desktop/CPM/input2.txt")
let graph = fileObject.getGraph()

let path = Path(graph)
print(path.generate())
print(path.getPathsWithDuration())
print(path.getCriticalPaths())
