//
//  LinkedListWrapper.swift
//  Playground
//
//  Created by CAR Software Systems on 16/12/24.
//

import SwiftUI

class LinkedListWrapper: ObservableObject {
    
    private var linkedList = LinkedList<Int>()
    @Published var values: [Int] = []

    func append(value: Int) {
        linkedList.append(value: value)
        refreshValues()
    }

    func remove(value: Int) {
        linkedList.remove(value: value)
        refreshValues()
    }

    private func refreshValues() {
        values = linkedList.getValues()
    }
}
