//
//  Stack.swift
//  CalculatorRPN
//
//  Created by Nurseit Akysh on 10/9/20.
//  Copyright © 2020 Nurseit Akysh. All rights reserved.
//

struct Stack <Element> {
    var array:[Element] = []
    var isEmpty: Bool {
        return array.isEmpty
    }
    var count:Int {
        return array.count
    }
    
    mutating func push(element: Element) {
        array.append(element)
    }
    mutating func pop() -> Element? {
        return array.popLast()
    }
    mutating func removeAll() {
        array.removeAll()
    }
    func peek() -> Element? {
        return array.last
    }
}
