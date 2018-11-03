//
//  main.swift
//  CPM
//
//  Created by Tebin on 9/28/18.
//  Copyright © 2018 Tebin. All rights reserved.
//
import Foundation

///`FileObject` to parse the input into `TaskNode` objects
let fileObject = FileObject("/Users/Tebin/Desktop/CPM/veryComplex.txt")
///`Graph` generated from `getGraph` method of `FileObject`
let graph = fileObject.getGraph()
///`Path` to generate all paths in a `Graph`
let path = Path(graph)
path.generate()

view(path, for: .Critical)
view(path, for: .None)

