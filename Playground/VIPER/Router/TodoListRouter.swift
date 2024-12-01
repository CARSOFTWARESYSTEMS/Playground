//
//  TodoListRouter.swift
//  Playground
//
//  Created by CAR Software Systems on 30/11/24.
//

import SwiftUI

class TodoListRouter: TodoListRouterProtocol {
    
    static func createModule() -> AnyView {
        let interactor = TodoListInteractor()
        let router = TodoListRouter()
        let presenter = TodoListPresenter(interactor: interactor, router: router)
        interactor.presenter = presenter
        let todoListView = TodoListView(presenter: presenter)

        return AnyView(todoListView)
    }
}
