//
//  10845.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 3/17/25.
//

/*
 10845 | 큐
 
 문제:
 정수를 저장하는 큐를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.

 명령은 총 여섯 가지이다.

 push X: 정수 X를 큐에 넣는 연산이다.
 pop: 큐에서 가장 앞에 있는 정수를 빼고, 그 수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 size: 큐에 들어있는 정수의 개수를 출력한다.
 empty: 큐가 비어있으면 1, 아니면 0을 출력한다.
 front: 큐의 가장 앞에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 back: 큐의 가장 뒤에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
 
 입력:
 첫째 줄에 주어지는 명령의 수 N (1 ≤ N ≤ 10,000)이 주어진다. 둘째 줄부터 N개의 줄에는 명령이 하나씩 주어진다. 주어지는 정수는 1보다 크거나 같고, 100,000보다 작거나 같다. 문제에 나와있지 않은 명령이 주어지는 경우는 없다.
 
 출력:
 출력해야하는 명령이 주어질 때마다, 한 줄에 하나씩 출력한다.
 
 */

final class Queue<T> {
    private(set) var elements: [T] = []
    private(set) var firstIndex: Int = 0
    
    var size: Int {
        elements.count - firstIndex
    }
    var isEmpty: Bool {
        firstIndex >= elements.count
    }
    
    func push(input: T) {
        elements.append(input)
    }
    
    func pop() -> T? {
        guard firstIndex < elements.count else {
            return nil
        }
        
        let element = elements[firstIndex]
        firstIndex += 1
        
        if firstIndex > 1000 {
            elements = Array(elements[firstIndex...])
            firstIndex = 0
        }
        
        return element
    }
    
    func front() -> T? {
        return isEmpty ? nil : elements[firstIndex]
    }
    
    func back() -> T? {
        return isEmpty ? nil : elements.last
    }
}

func p10845() {
    if let input = readLine(), let inputTotalNumber = Int(input) {
        let queue = Queue<Int>()
        
        // 반복
        for _ in 1 ... inputTotalNumber {
            guard let input = readLine() else { break }
            
            let orders = input.split(separator: " ")
            if let order = orders.first {
                
                switch order {
                case "push":
                    if let inputNumber = Int(orders[1]) {
                        queue.push(input: inputNumber)
                    }
                case "pop":
                    let value = queue.pop()
                    print("\(value ?? -1)")
                case "size":
                    let value = queue.size
                    print("\(value)")
                case "empty":
                    let value = queue.isEmpty ? 1 : 0
                    print("\(value)")
                case "front":
                    let value = queue.front()
                    print("\(value ?? -1)")
                case "back":
                    let value = queue.back()
                    print("\(value ?? -1)")
                default:
                    break
                }
                
            }
        }
    }
}
