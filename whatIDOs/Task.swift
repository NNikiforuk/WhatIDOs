//
//  Task.swift
//  whatIDOs
//
//  Created by Natalia Nikiforuk on 22/10/2024.
//

import Foundation
import SwiftData

@Model
class Task: Identifiable {
    var id = UUID()
    var title: String
    var completed: Bool
    
    init(id: UUID = UUID(), title: String, completed: Bool) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}
