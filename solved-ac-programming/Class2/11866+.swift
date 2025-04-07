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
 제거 연산이 O(1)로 수행되어, 데이터의 개수가 많을 때 효율적
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

func p11866_circularLinkedList() {
    let input = readLine()!

    let command = input.split(separator: " ")
    let N = Int(command[0])!
    let K = Int(command[1])!
    let list = CircularLinkedList(count: N, k: K)

    var output = "<"

    while !list.isEmpty {
        let element = list.removeNext()
        output.append("\(element!)")
        if !list.isEmpty {
            output.append(", ")
        }
    }
    output += ">"
    print(output)
}

final class CircularLinkedList {
    final class Node {
        let value: Int
        var next: Node?
        var prev: Node?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    private(set) var current: Node? // 현재 위치 포인터
    private(set) var count: Int = 0
    private let k: Int
    
    /// 생성자: 1부터 count까지 노드 생성 후 원형 연결
    init(count: Int, k: Int) {
        self.k = k
        self.count = count
        
        if count > 0 {
            let first = Node(value: 1)
            var last = first
            
            for i in 2 ... count {
                let node = Node(value: i)
                last.next = node
                node.prev = last
                last = node
            }
            
            // 원형 연결: 마지막 노드 및 첫 노드 연결
            last.next = first
            first.prev = last
            self.current = first
        }
    }
    
    var isEmpty: Bool {
        count == 0
    }
    
    /// 현재 위치에서 (k-1)번 이동하여 노드 제거 후 반환
    func removeNext() -> Int? {
        guard let current = current, count > 0 else {
            return nil
        }
        
        var node = current
        for _ in 1 ... (k - 1) {
            node = node.next!
        }
        let removedValue = node.value
        
        // 마지막 노드 처리
        if node.next === node {
            self.current = nil
        } else {
            node.prev?.next = node.next
            node.next?.prev = node.prev
            self.current = node.next
        }
        
        count -= 1
        return removedValue
    }
}

/**
 === (n, k)-요세미티 순열 List 벤치마크 시작 ====
 circularList (1000000, 3) - 10회, 평균: 9.1680944997초, 표준편차: 27.504282802766667초, 최소: 1.55e-07초, 최대: 91.680942908초
 circularLinkedList (1000000, 3) - 10회, 평균: 0.2201784788초, 표준편차: 0.6605351850666685초, 최소: 5.5e-08초, 최대: 2.201784034초
 */
func run11866Benchmark() {
    let elementCount = 1_000_000
    let k = 3
    let runs = 10
    
    print("=== (n, k)-요세미티 순열 List 벤치마크 시작 ====")
    let circularList = CircularList(count: elementCount, k: k)
    measureTimeStats(title: "circularList (\(elementCount), \(k))", runs: runs) {
        while !circularList.isEmpty {
            let _ = circularList.popNext()
        }
    }
    
    let circularLinkedList = CircularLinkedList(count: elementCount, k: k)
    measureTimeStats(title: "circularLinkedList (\(elementCount), \(k))", runs: runs) {
        while !circularLinkedList.isEmpty {
            let _ = circularLinkedList.removeNext()
        }
    }
}
