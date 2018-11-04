//
//  main.swift
//  CPM
//
//  Created by Tebin on 9/28/18.
//  Copyright © 2018 Tebin. All rights reserved.
//
import Foundation

///`FileObject` to parse the input into `TaskNode` objects
let fileObject = FileObject("/Users/Tebin/Desktop/CPM/complex.txt")
///`Graph` generated from `getGraph` method of `FileObject`
let graph = fileObject.getGraph()
///`Path` to generate all paths in a `Graph`
let path = Path(graph)
path.generate()
///View CPM for critical paths
view(path, for: .Critical)
///View CPM for none critical paths
view(path, for: .None)
///View the project summary
summary(path)
