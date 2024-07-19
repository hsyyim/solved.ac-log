//
//  4153.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 7/19/24.
//

/*
 4153 | 직각삼각형
 
 문제:
 과거 이집트인들은 각 변들의 길이가 3, 4, 5인 삼각형이 직각 삼각형인것을 알아냈다. 주어진 세변의 길이로 삼각형이 직각인지 아닌지 구분하시오.
 
 입력:
 입력은 여러개의 테스트케이스로 주어지며 마지막줄에는 0 0 0이 입력된다. 각 테스트케이스는 모두 30,000보다 작은 양의 정수로 주어지며, 각 입력은 변의 길이를 의미한다.
 
 출력:
 각 입력에 대해 직각 삼각형이 맞다면 "right", 아니라면 "wrong"을 출력한다.
 
 입력:
 6 8 10
 25 52 60
 5 12 13
 0 0 0
 
 출력:
 right
 wrong
 right
 
 */
import Foundation

while let inputs = readLine() {
    let sides = inputs.split(separator: " ").map { Float($0)! }.sorted()
    if sides.contains(0) { break }
    
    let exponent: Float = 2.0
    let a = Int(pow(sides[0], exponent))
    let b = Int(pow(sides[1], exponent))
    let c = Int(pow(sides[2], exponent))
    
    print(a + b == c ? "right" : "wrong")
}

