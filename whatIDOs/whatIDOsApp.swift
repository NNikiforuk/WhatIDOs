//
//  whatIDOsApp.swift
//  whatIDOs
//
//  Created by Natalia Nikiforuk on 20/10/2024.
//

import SwiftUI
import SwiftData

@main
struct whatIDOsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Task.self)
        }
    }
}
