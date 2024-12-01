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

//ViewToPresenter | Protocol for Presenter (View will call this method)
protocol TodoListPresenterProtocol: AnyObject {
    func viewDidLoad()
}

//PresenterToInteractor | Protocol for Interactor (Presentor will ask Interactor to fetch the data)
protocol TodoListInteractorProtocol: AnyObject {
    func fetchTasks()
}

//InteractorToPresenter | Protocol for Presenter (Interactor Response) (Presentor will be using this protocol)
protocol TodoListInteractorOutputProtocol: AnyObject {
    func didFetchTasks(_ tasks: [TaskEntity])
}

