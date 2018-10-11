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

view(path, for: .Critical)
view(path, for: .None)

