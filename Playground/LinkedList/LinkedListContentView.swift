//
//  LinkedListContentView.swift
//  Playground
//
//  Created by CAR Software Systems on 16/12/24.
//

import SwiftUI

struct LinkedListContentView: View {
    
    @StateObject private var linkedList = LinkedListWrapper()
    @State private var newValue: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Enter value", text: $newValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                HStack(spacing: 10) {
                    Button(action: {
                        if let intValue = Int(newValue) {
                            linkedList.append(value: intValue)
                            newValue = ""
                        }
                    }) {
                        Text("Add Value")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }

                    Button(action: {
                        if let intValue = Int(newValue) {
                            linkedList.remove(value: intValue)
                            newValue = ""
                        }
                    }) {
                        Text("Remove Value")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }

                List(linkedList.values, id: \.self) { value in
                    Text("Value: \(value)")
                }
            }
            .navigationTitle("Linked List")
        }
    }
}
