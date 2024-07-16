//
//  1330.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 7/16/24.
//

/*
 1330 | 두 수 비교하기
 
 문제:
 두 정수 A와 B가 주어졌을 때, A와 B를 비교하는 프로그램을 작성하시오.
 
 입력:
 첫째 줄에 A와 B가 주어진다. A와 B는 공백 한 칸으로 구분되어져 있다.
 
 출력:
 첫째 줄에 다음 세 가지 중 하나를 출력한다.

 A가 B보다 큰 경우에는 '>'를 출력한다.
 A가 B보다 작은 경우에는 '<'를 출력한다.
 A와 B가 같은 경우에는 '=='를 출력한다.
 
 입력:
 1 2
 
 출럭:
 <
 
 */
enum Comparison: String {
    case less = "<"
    case greater = ">"
    case equal = "=="
}
extension Int {
    func compare(with B: Int) -> Comparison {
        if self < B { return .less }
        else if self > B { return .greater }
        else { return .equal }
    }
}
if let input = readLine() {
    let inputs = input.split(separator: " ").map { Int($0)! }
    let result = inputs[0].compare(with: inputs[1])
    print(result.rawValue)
}


/*
 결과     정답
 메모리    69100 KB
 시간     8 ms
 코드길이  446 B
 */
