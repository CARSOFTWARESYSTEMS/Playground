//
//  LinkedList.swift
//  Playground
//
//  Created by CAR Software Systems on 16/12/24.
//

class LinkedList <T: Comparable> {
    
    private var head: LinkedListNode<T>?

    func append(value: T) {
        let newNode = LinkedListNode(value: value)
        if let head = head {
            var current = head
            while let next = current.next {
                current = next
            }
            current.next = newNode
        } else {
            head = newNode
        }
    }

    
    func remove(value: T) {
        guard head != nil else { return }
        if head?.value == value {
            head = head?.next
            return
        }

        var current = head
        while let next = current?.next {
            if next.value == value {
                current?.next = next.next
                return
            }
            current = next
        }
    }



    func getValues() -> [T] {
        var values = [T]()
        var current = head
        while let node = current {
            values.append(node.value)
            current = node.next
        }
        return values
    }
}
