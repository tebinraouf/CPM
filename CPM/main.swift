//
//  main.swift
//  CPM
//
//  Created by Tebin on 9/28/18.
//  Copyright © 2018 Tebin. All rights reserved.
//
import Foundation

class Path {
    private var allPaths = [[TaskNode]]()
    private var paths = [TaskNode]()
    
    private func getPaths(_ graph: Graph, source: TaskNode) {
        paths.append(source)
        source.isVisitted = true
        
        for edge in source.successors {
            if !edge.neighbor.isVisitted  {
                getPaths(graph, source: edge.neighbor)
            }
        }
        source.isVisitted = false
        if source.successors.count == 0 {
            allPaths.append(paths)
        }
        else {
            source.isVisitted = false
            for edge in source.successors {
                edge.neighbor.isVisitted = false
            }
        }
        //pop the last item. Result is unused.
        let _ = paths.popLast()
    }
}

//var allPaths = [[TaskNode]]()
//var paths = [TaskNode]()
//
//func getPaths(_ graph: Graph, source: TaskNode) {
//    paths.append(source)
//    source.isVisitted = true
//
//    for edge in source.successors {
//        if !edge.neighbor.isVisitted  {
//            getPaths(graph, source: edge.neighbor)
//        }
//    }
//    source.isVisitted = false
//    if source.successors.count == 0 {
//        allPaths.append(paths)
//    }
//    else {
//        source.isVisitted = false
//        for edge in source.successors {
//            edge.neighbor.isVisitted = false
//        }
//    }
//    //pop the last item. Result is unused.
//    let _ = paths.popLast()
//}



//let taskA = TaskNode(name: "A", duration: 2)
//let taskB = TaskNode(name: "B", duration: 3)
//let taskC = TaskNode(name: "C", duration: 4)
//let taskD = TaskNode(name: "D", duration: 2)
//let taskE = TaskNode(name: "E", duration: 2)
//let taskF = TaskNode(name: "F", duration: 2)
//let taskH = TaskNode(name: "H", duration: 5)
//let taskG = TaskNode(name: "G", duration: 1)
//
//let graph = Graph()
//graph.addTask(taskA)
//graph.addTask(taskB)
//graph.addTask(taskC)
//graph.addTask(taskD)
//graph.addTask(taskE)
//graph.addTask(taskF)
//graph.addTask(taskH)
//graph.addTask(taskG)
//
//graph.addEdge(taskA, neighbor: taskB)
//graph.addEdge(taskA, neighbor: taskH)
//graph.addEdge(taskB, neighbor: taskC)
//graph.addEdge(taskB, neighbor: taskD)
//graph.addEdge(taskC, neighbor: taskE)
//graph.addEdge(taskD, neighbor: taskE)
//graph.addEdge(taskE, neighbor: taskF)
//graph.addEdge(taskE, neighbor: taskG)

//getPaths(graph, source: taskA)
//print("hi...")


/*
 1. Find the crtical path
 2. Set the ES, EF, LS, LF on the nodes on the critical path
 3. Use 2 to set other E*, L*
 */


//let path = Path()

//the input

struct FileObject {
    var header: [String]
    var rows: [[String]]
}
func convertToObject(_ rows: [Substring]?) -> FileObject? {
    guard var rows = rows else { return nil}
    let header = rows.removeFirst()
    let headerArray = header.split(separator: ",").map({String($0)})
    
    var rowsArray = [[String]]()
    for row in rows {
        let rowArray = row.split(separator: ",").map({String($0)})
        rowsArray.append(rowArray)
    }
    let fileObject = FileObject(header: headerArray, rows: rowsArray)
    return fileObject
}
func read(file path: String) -> FileObject? {
    let fileURL = URL(fileURLWithPath: path)
    do {
        let content = try String(contentsOf: fileURL, encoding: .utf8)
        let rows = content.split(separator: "\n")
        return convertToObject(rows)
    }
    catch {
        print(error.localizedDescription)
    }
    return nil
}


let objects = read(file: "/Users/Tebin/Desktop/CPM/input.txt")
print(objects)
