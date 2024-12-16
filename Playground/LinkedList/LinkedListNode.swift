//
//  LinkedListNode.swift
//  Playground
//
//  Created by CAR Software Systems on 16/12/24.
//

class LinkedListNode <T> {
    
    var value: T
    var next: LinkedListNode?

    init(value: T, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}
