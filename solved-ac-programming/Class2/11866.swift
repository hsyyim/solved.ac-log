//
//  11866.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 4/3/25.
//

/*
 11866 | 요세푸스 문제 0
 
 문제:
 요세푸스 문제는 다음과 같다.

 1번부터 N번까지 N명의 사람이 원을 이루면서 앉아있고, 양의 정수 K(≤ N)가 주어진다. 이제 순서대로 K번째 사람을 제거한다. 한 사람이 제거되면 남은 사람들로 이루어진 원을 따라 이 과정을 계속해 나간다. 이 과정은 N명의 사람이 모두 제거될 때까지 계속된다. 원에서 사람들이 제거되는 순서를 (N, K)-요세푸스 순열이라고 한다. 예를 들어 (7, 3)-요세푸스 순열은 <3, 6, 2, 7, 5, 1, 4>이다.

 N과 K가 주어지면 (N, K)-요세푸스 순열을 구하는 프로그램을 작성하시오.

 입력:
 첫째 줄에 N과 K가 빈 칸을 사이에 두고 순서대로 주어진다. (1 ≤ K ≤ N ≤ 1,000)

 출력:
 예제와 같이 요세푸스 순열을 출력한다.

 예제 입력 1:
 7 3
 예제 출력 1:
 <3, 6, 2, 7, 5, 1, 4>
 
 알고리즘 분류:
 구현
 자료 구조
 큐
 
 */

func p11866() {
    let input = readLine()!

    let command = input.split(separator: " ")
    let N = Int(command[0])!
    let K = Int(command[1])!
    print("\(N) \(K)")
    let permutation = Permutation(n: N)
    permutation.setList()

    var output = "<"
    while !permutation.isEmpty {
        for _ in 1 ..< K {
            permutation.next()
        }
        if let removal = permutation.pop() {
            output.append("\(removal)")
        }
        if !permutation.isEmpty {
            output.append(", ")
        }
    }
    output.append(">")

    print(output)
}

final class Permutation {
    private(set) var list: [Int] = []
    private(set) var index: Int = 0
    private(set) var count: Int
    
    init(n count: Int) {
        self.count = count
    }
    var isEmpty: Bool {
        list.isEmpty
    }
    
    func setList() {
        for num in 1 ... count {
            list.append(num)
        }
    }
    
    func next() {
        guard index < list.count - 1 else {
            index = 0
            return
        }
        index += 1
    }
    func pop() -> Int? {
        let element = list.remove(at: index)
        
        if index >= list.count {
            index = 0
        }
        return element
    }
}
