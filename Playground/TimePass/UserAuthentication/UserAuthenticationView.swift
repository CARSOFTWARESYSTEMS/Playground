//
//  UserAuthenticationView.swift
//  MyAppPlayground
//
//  Created by CAR Software Systems on 15/11/24.
//

import SwiftUI
import SwiftData

struct UserAuthenticationView: View {
    
    @State private var isSwiftDataView = true
    @State private var buttonColor: Color = Color.white
    @State private var buttonTitle = "Show CoreData View"
    
    var body: some View {
        NavigationView {
            
                ZStack {
                    backgroundColour.ignoresSafeArea()
                    Rectangle().scale(0.89).foregroundColor(foregroundColour.opacity(0.9)).cornerRadius(50)
                    Rectangle().scale(0.85).foregroundColor(foregroundColour.opacity(0.7)).cornerRadius(50)
                    
                    VStack {
                        Button(buttonTitle) {
                            isSwiftDataView.toggle()
                            if isSwiftDataView {
                                buttonTitle = "Show CoreData View"
                                
                            } else {
                                buttonTitle = "Show SwiftData View"
                            }
                            
                        }.font(.title).foregroundColor(buttonColor)
                        
                        buildDynamicView(DataView: isSwiftDataView)
                        
                    }
                }
        }
    }
}
    

@ViewBuilder
func buildDynamicView(DataView isSwiftDataView: Bool) -> some View {
        if isSwiftDataView {
            AddUserView() //SwiftData
        } else {
            TaskContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            //CoreData
            
        }
    }


struct AddUserView : View {

    @Environment(\.modelContext) private var modelContext
    @Query var users: [UserModel]
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach(users) { user in
                        VStack(alignment: .leading) {
                            Text(user.username)
                                .font(.headline)
                            
                            Text(user.password)
                                .font(.headline)
                        }
                    }.onDelete(perform: deleteUser)
                }
                .navigationTitle("SwiftData - User Authentication")
                .toolbar {
                    Button("Add", action: addUser)
                }
                
            }
        }
    }
    
    func addUser() {
        
        let user = UserModel()

        user.username = "Sudarshana"
        user.password = "Karkala"

        modelContext.insert(user)
        
        try? modelContext.save()
    }
    
    func deleteUser(_ indexSet: IndexSet) {
        for index in indexSet {
            let user = users[index]
            modelContext.delete(user)
        }
    }
}


#Preview {
    UserAuthenticationView()
}
