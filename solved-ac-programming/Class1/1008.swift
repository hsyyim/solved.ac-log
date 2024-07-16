//
//  1008.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 7/16/24.
//

/*
 1008 | A/B
 
 문제:
 두 정수 A와 B를 입력받은 다음, A/B를 출력하는 프로그램을 작성하시오.
 
 입력:
 첫째 줄에 A와 B가 주어진다. (0 < A, B < 10)
 
 출력:
 첫째 줄에 A/B를 출력한다. 실제 정답과 출력값의 절대오차 또는 상대오차가 10-9 이하이면 정답이다.
 
 입력:
 1 3
 
 출럭:
 0.33333333333333333333333333333333
 
 */
if let input = readLine() {
    let numbers = input.split(separator: " ").map { Double($0)! }
    print (numbers[0] / numbers[1])
}


/*
 결과     정답
 메모리    69100 KB
 시간     8 ms
 코드길이  131 B
 */
