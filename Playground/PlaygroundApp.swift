//
//  PlaygroundApp.swift
//  Playground
//
//  Created by Ananth on 17/08/24.
//

import SwiftUI
import SwiftData

@main
struct PlaygroundApp: App {
   
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [UserModel.self])
    }
}
