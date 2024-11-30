//
//  TodoListPresenter.swift
//  Playground
//
//  Created by CAR Software Systems on 30/11/24.
//

import Foundation


class TodoListPresenter: ObservableObject, TodoListPresenterProtocol, TodoListInteractorOutputProtocol {
    @Published var tasks: [TaskEntity] = []

    private var interactor: TodoListInteractorProtocol
    private var router: TodoListRouterProtocol

    init(interactor: TodoListInteractorProtocol, router: TodoListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() { /* TodoListPresenterProtocol */
        interactor.fetchTasks()
    }

    func didFetchTasks(_ tasks: [TaskEntity]) { /* TodoListInteractorOutputProtocol */
        DispatchQueue.main.async {
            self.tasks = tasks
        }
    }
}
