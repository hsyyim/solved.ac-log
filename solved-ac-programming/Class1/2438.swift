//
//  2438.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 7/16/24.
//

/*
 2438 | 별 찍기 - 1
 
 문제:
 첫째 줄에는 별 1개, 둘째 줄에는 별 2개, N번째 줄에는 별 N개를 찍는 문제
 
 입력:
 첫째 줄에 N(1 ≤ N ≤ 100)이 주어진다.
 
 출력:
 첫째 줄부터 N번째 줄까지 차례대로 별을 출력한다.
 
 입력:
 5
 
 출럭:
 *
 **
 ***
 ****
 *****
 
 */

if let input = readLine(), let n = Int(input) {
    for element in 1...n {
        let line = Array(repeating: "*", count: element).joined()
        print(line)
    }
}
