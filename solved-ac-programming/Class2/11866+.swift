//
//  11866+.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 4/7/25.
//

import Foundation

/**
 - 모듈러 연산:
 모듈러 연산으로 다음에 제거할 인덱스 계산
 
 - Linked List 자료구조:
 */

func p11866_withModularArithmetic() {
    let input = readLine()!

    let command = input.split(separator: " ")
    let N = Int(command[0])!
    let K = Int(command[1])!
    let list = CircularList(count: N, k: K)

    var output = "<"

    while !list.isEmpty {
        let element = list.popNext()
        output.append("\(element!)")
        if !list.isEmpty {
            output.append(", ")
        }
    }
    output += ">"
    print(output)
}

final class CircularList {
    private(set) var list: [Int] = []
    private(set) var index = 0
    private let k: Int
    
    init(count: Int, k: Int) {
        self.list = Array(1...count)
        self.k = k
    }
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    func popNext() -> Int? {
        index = (index + (k - 1)) % list.count
        return list.remove(at: index)
    }
}
