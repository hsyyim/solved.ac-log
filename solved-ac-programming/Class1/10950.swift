//
//  10950.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 7/16/24.
//

/*
 10950 | A+B - 3
 
 문제:
 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.
 
 입력:
 첫째 줄에 테스트 케이스의 개수 T가 주어진다.
 각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)
 
 출력:
 각 테스트 케이스마다 A+B를 출력한다.
 
 입력:
 5
 1 1
 2 3
 3 45
 
 출럭:
 2
 5
 7
 
 */

func readInput() -> [(Int, Int)]? {
    guard let input = readLine(), let testcaseCount = Int(input) else { return nil }
    
    var testcaseData = [(Int, Int)]()
    for _ in 0..<testcaseCount {
        if let additionalInput = readLine() {
            let components = additionalInput.split(separator: " ").map { Int($0)! }
            testcaseData.append((components[0], components[1]))
        }
    }
    return testcaseData
}

if let cases = readInput() {
    for testcase in cases {
        let result = testcase.0 + testcase.1
        print(result)
    }
}
