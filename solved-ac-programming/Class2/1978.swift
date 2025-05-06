//
//  1978.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 5/1/25.
//

/*
 1978 | 소수 찾기
 
 문제:
 주어진 수 N개 중에서 소수가 몇 개인지 찾아서 출력하는 프로그램을 작성하시오.

 입력:
 첫 줄에 수의 개수 N이 주어진다. N은 100이하이다. 다음으로 N개의 수가 주어지는데 수는 1,000 이하의 자연수이다.

 출력:
 주어진 수들 중 소수의 개수를 출력한다.
 */

import Foundation

func p1978() {
    let line = Int(readLine()!)
    let numbersInput = readLine()!.split(separator: " ").map { Int($0)! }

    let primeCount = numbersInput.filter { isPrime($0) }.count
    print("\(primeCount)")

    func isPrime(_ number: Int) -> Bool {
        if number < 2 { return false }
        if number == 2 { return true }
        if number % 2 == 0 { return false }
        
        let sqrtNumber = Int(Double(number).squareRoot())
        for i in stride(from: 3, through: sqrtNumber, by: 2) {
            if number % i == 0 {
                return false
            }
        }
        return true
    }
}
