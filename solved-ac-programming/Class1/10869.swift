//
//  10869.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 7/14/24.
//

/*
 10869 | 사칙연산
 
 문제:
 두 자연수 A와 B가 주어진다. 이때, A+B, A-B, A*B, A/B(몫), A%B(나머지)를 출력하는 프로그램을 작성하시오.
 
 입력:
 두 자연수 A와 B가 주어진다. (1 ≤ A, B ≤ 10,000)
 
 출력:
 첫째 줄에 A+B, 둘째 줄에 A-B, 셋째 줄에 A*B, 넷째 줄에 A/B, 다섯째 줄에 A%B를 출력한다.
 
 입력:
 7 3
 
 출럭:
 10
 4
 21
 2
 1
 
 */

func readInput() -> (Int, Int)? {
    guard let input = readLine() else { return nil }
    let components = input.split(separator: " ")
    return (Int(components[0])!, Int(components[1])!)
}

if let naturalNumbers = readInput() {
    
    let addition = naturalNumbers.0 + naturalNumbers.1
    let subtraction = naturalNumbers.0 - naturalNumbers.1
    let multiplication = naturalNumbers.0 * naturalNumbers.1
    let division = naturalNumbers.0 / naturalNumbers.1
    let remainder = naturalNumbers.0 % naturalNumbers.1
    
    print("""
        \(addition)
        \(subtraction)
        \(multiplication)
        \(division)
        \(remainder)
        """)
}



/*
 결과     정답
 메모리    69104 KB
 시간     8 ms
 코드길이  664 B
 */
