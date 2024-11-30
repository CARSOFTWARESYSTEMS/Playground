//
//  TodoListInteractor.swift
//  Playground
//
//  Created by CAR Software Systems on 30/11/24.
//



class TodoListInteractor: TodoListInteractorProtocol {
    weak var presenter: TodoListInteractorOutputProtocol?

    func fetchTasks() {
        let sampleTasks = [TaskEntity(name: "Buy groceries"),
                           TaskEntity(name: "Complete homework"),
                           TaskEntity(name: "Pay bills")]
        
        presenter?.didFetchTasks(sampleTasks)
    }
}
