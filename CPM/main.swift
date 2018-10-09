//
//  main.swift
//  CPM
//
//  Created by Tebin on 9/28/18.
//  Copyright © 2018 Tebin. All rights reserved.
//
import Foundation
/*
 1. Find the crtical path
 2. Set the ES, EF, LS, LF on the nodes on the critical path
 3. Use 2 to set other E*, L*
 */

let fileObject = FileObject("/Users/Tebin/Desktop/CPM/input2.txt")
let graph = fileObject.getGraph()

let path = Path(graph)
path.generate()
//print(path.criticalPaths)
