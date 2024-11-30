//
//  TodoListProtocols.swift
//  Playground
//
//  Created by CAR Software Systems on 30/11/24.
//
import SwiftUI
import Foundation

protocol TodoListRouterProtocol {
    static func createModule() -> AnyView
}

protocol TodoListPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol TodoListViewProtocol: AnyObject {
    func showTasks(_ tasks: [TaskEntity])
}

protocol TodoListInteractorProtocol: AnyObject {
    func fetchTasks()
}

protocol TodoListInteractorOutputProtocol: AnyObject {
    func didFetchTasks(_ tasks: [TaskEntity])
}

