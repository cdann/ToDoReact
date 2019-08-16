//
//  task.swift
//  toDoReqcy
//
//  Created by celine dann on 16/08/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import Foundation

class Task: Codable, CustomStringConvertible {
    let id: String
    var title: String
    var dueDate: Date?
    var completed: Date?
    
    var description: String {
        return "\(title) :: due \(dueDate) :: completed \(completed)"
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case completed
        case id = "_id"
        case dueDate = "date"
    }
    
    init(id: String, title: String, dueDate: Date? = nil, completed: Date? = nil) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.completed = completed
    }
}

struct JsonTasks: Codable {
    let tasks: [Task]
    
    static func getTasksFromJson() -> [Task]{
        do {
            if let filePath = Bundle.main.path(forResource: "toDo", ofType: "json") {
                let url = URL(fileURLWithPath: filePath)
                let datas = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.momentjsDate)
                let jsonTasks = try decoder.decode(JsonTasks.self, from: datas)
                print(jsonTasks.tasks)
                return jsonTasks.tasks
            }
        } catch let error {
            print(error)
        }
        return []
    }
}
