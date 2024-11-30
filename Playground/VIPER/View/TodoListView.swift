//
//  TodoListView.swift
//  Playground
//
//  Created by CAR Software Systems on 30/11/24.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var presenter: TodoListPresenter

    var body: some View {
        NavigationView {
            List(presenter.tasks, id: \.name) { task in
                Text(task.name)
            }
            .navigationTitle("Tasks")
            .onAppear {
                presenter.viewDidLoad()
            }
        }
    }
}



