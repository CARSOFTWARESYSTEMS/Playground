//
//  ContentView.swift
//  Playground
//
//  Created by Ananth on 17/08/24.
//

import SwiftUI

struct ContentView: View {
    
    let persistenceController = PersistenceController.shared
    
    var itemsView: [String] = ["ChessView", "SwiftDataView", "CoreDataView"]
    
   
    
    var body: some View {
        
        VStack {
            NavigationView {
                List {
                    ForEach(itemsView, id: \.self) { item in
                        NavigationLink(destination: showSubViews(choice: item)) {
                            Text(item)
                        }
                    }
                }
               
            }.navigationTitle("Main Menu")
        }
        .padding()
    }
    
    @ViewBuilder
    func showSubViews(choice: String) -> some View {
        switch choice {
        case "ChessView"     : ChessView()
        case "SwiftDataView" : UserAuthenticationView()
        case "CoreDataView"  : TaskContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        default : ChessView()
            
            
            

            
        }
    }
}

#Preview {
    ContentView()
}
