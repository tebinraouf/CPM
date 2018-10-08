//
//  FileObject.swift
//  CPM
//
//  Created by Tebin on 10/6/18.
//  Copyright © 2018 Tebin. All rights reserved.
//

import Foundation

/**
 The class to parse a text file into objects and graph
 */
class FileObject {
    private var header: [String]
    private var rows: [[String]]
    private var filePath: String
    

    public init(_ filePath: String) {
        self.filePath = filePath
        //initial values
        self.header = [String]()
        self.rows = [[String]]()
    }
    ///Get the populated graph
    func getGraph() -> Graph {
        //1. Read the file
        read(file: self.filePath)
        //2. populate graph and return it
        return populateGraph()
    }
    ///Populate the graph in three steps
    ///1. Create TaskNode for each task
    ///2. Create Successors for each task
    ///3. Create Predecessors for each task
    private func populateGraph() -> Graph {
        let graph = Graph()
        //1. Create TaskNode per task and then add to graph.
        for row in rows {
            let taskName = row[0]
            let taskDuration = row[1]
            let task = TaskNode(name: taskName, duration: Int(taskDuration))
            graph.addTask(task)
        }
        let dictionary = convertRowToDictionary()
        //2. for each task in the graph, add the successors
        for task in graph.tasks {
            //get the key value pair where the key is the task name, and the value is the successor
            for (key,value) in dictionary {
                //The successor is the "value" which is an array. There might be more than on successor.
                for eachValue in value {
                    if task.name! == eachValue {
                        //we don't know the neight use the key to get the name and find it in the graph
                        graph.addSuccessorEdge(task, neighbor: graph.getTask(by: key)!)
                    }
                }
            }
        }
        //3. add predecessors for each task
        for (key,predecessors) in dictionary {
            let currentTask = graph.getTask(by: key)
            for predecessor in predecessors {
                let predecessorTask = graph.getTask(by: predecessor)
                graph.addPredecessorEdge(currentTask, neighbor: predecessorTask)
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
    ///Read the given file and parse
    private func read(file path: String) {
        let fileURL = URL(fileURLWithPath: path)
        do {
            var content = try String(contentsOf: fileURL, encoding: .utf8)
            let startingCount = content.uppercased().components(separatedBy: "NA").count - 1
            
            //If there are two or more tasks with NA for predecessor, then we need a comman starting point with duration 0.
            if startingCount > 1 {
                content = content.uppercased().replacingOccurrences(of: "NA", with: "Start")
                content = content + "Start,0,NA\n"
            }
            let rows = content.split(separator: "\n")
            print(rows)
            convertToObject(rows)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    ///Utility Function to parse the input
    ///separator is comma ","
    private func convertToObject(_ rows: [Substring]?) {
        guard var rows = rows else { return }
        let header = rows.removeFirst()
        let headerArray = header.split(separator: ",").map({String($0)})
        
        var rowsArray = [[String]]()
        for row in rows {
            let rowArray = row.split(separator: ",").map({String($0)})
            rowsArray.append(rowArray)
        }
        
        self.header = headerArray
        self.rows = rowsArray
    }
}

