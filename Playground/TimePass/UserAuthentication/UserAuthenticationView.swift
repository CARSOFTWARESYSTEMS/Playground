//
//  UserAuthenticationView.swift
//  MyAppPlayground
//
//  Created by CAR Software Systems on 15/11/24.
//

import SwiftUI
import SwiftData

struct UserAuthenticationView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var users: [UserModel]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.teal.ignoresSafeArea()
                Rectangle().scale(0.89).foregroundColor(.white.opacity(0.15))
                Rectangle().scale(0.87).foregroundColor(.white.opacity(0.5))
                Button("Add Users") {
                    addUser()
                }
                
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
                        .navigationTitle("User Authentication")
                        .toolbar {
                            Button("Add", action: addUser)
                        }
                        
                    }
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
