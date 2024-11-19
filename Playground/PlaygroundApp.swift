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
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            //ChessView()
            UserAuthenticationView()
            
            //TaskContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
           
            
        }.modelContainer(for: [UserModel.self])
    }
}
