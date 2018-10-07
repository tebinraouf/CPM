//
//  main.swift
//  CPM
//
//  Created by Tebin on 9/28/18.
//  Copyright © 2018 Tebin. All rights reserved.
//
import Foundation

class Path {
    public var allPaths = [[TaskNode]]()
    private var paths = [TaskNode]()
    
    public func getPaths(_ graph: Graph, source: TaskNode) {
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
    private var header: [String]
    private var rows: [[String]]
    
    public init(header: [String], rows: [[String]]) {
        self.header = header
        self.rows = rows
    }
    public func getGraph() -> Graph {
        let graph = Graph()
        //Create TaskNode per task and then add to graph.
        for row in rows {
            let taskName = row[0]
            let taskDuration = row[1]
            let task = TaskNode(name: taskName, duration: Int(taskDuration))
            graph.addTask(task)
        }
        let dictionary = convertRowToDictionary()
        //for each task in the graph, add the successors
        for task in graph.tasks {
            //get the key value pair where the key is the task name, and the value is the successor
            for (key,value) in dictionary {
                //The successor is the "value" which is an array. There might be more than on successor.
                for eachValue in value {
                    if task.name! == eachValue {
                        //we don't know the neight use the key to get the name and find it in the graph
                        graph.addEdge(task, neighbor: graph.getTask(by: key)!)
                    }
                }
            }
        }
        return graph
    }
    ///Create dictionary for the tasks from "rows". Key: is the task name, Value: is an array of task name
    ///For example:
    ///["A", "2", "na"] -> "A": ["na"]
    ///["B","3","A"] -> "B" : ["A"]
    ///This is a helper function
    private func convertRowToDictionary() -> Dictionary<String, [String]>{
        var dictionary = Dictionary<String, [String]>()
        for row in rows {
            var copyRow = row
            let key = copyRow.removeFirst()
            //remove the second column, which is the duration.
            copyRow.removeFirst()
            dictionary[key] = copyRow
        }
        return dictionary
    }
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


let objects = read(file: "/Users/Tebin/Desktop/CPM/input2.txt")
let graph = objects?.getGraph()
let path = Path()
path.getPaths(graph!, source: (graph?.tasks.first)!)
print(path.allPaths)
