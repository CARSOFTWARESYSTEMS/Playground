//
//  TodoListProtocols.swift
//  Playground
//
//  Created by CAR Software Systems on 30/11/24.
//
import SwiftUI
import Foundation

//Protocol for Router (Presenter will be using router)
protocol TodoListRouterProtocol {
    static func createModule() -> AnyView
}

//Protocol for Presentor (View will be using this protocol)
protocol TodoListPresenterProtocol: AnyObject {
    func viewDidLoad()
}

//Protocol for View (View will be using this protocol)
protocol TodoListViewProtocol: AnyObject {
    func showTasks(_ tasks: [TaskEntity])
}

//Protocol for Interactor (Presentor will be using this protocol)
protocol TodoListInteractorProtocol: AnyObject {
    func fetchTasks()
}

//Protocol for Interactor Response (Presentor will be using this protocol)
protocol TodoListInteractorOutputProtocol: AnyObject {
    func didFetchTasks(_ tasks: [TaskEntity])
}

