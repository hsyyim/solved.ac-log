//
//  1978+.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 5/6/25.
//

import Foundation

func p1978_eratosthenes() {
    // 입력 처리
    let line = Int(readLine()!)
    let numbersInput = readLine()!.split(separator: " ").map { Int($0)! }

    // 0~1000까지의 소수 여부를 미리 계산
    let isPrimeTable = generatePrimeTable(upTo: 1000)

    // 소수 개수 세기
    let primeCount = numbersInput.filter { isPrimeTable[$0] }.count
    print(primeCount)

    // 에라토스테네스의 체를 이용하여 0부터 max까지의 소수 여부를 미리 계산하는 함수
    func generatePrimeTable(upTo max: Int) -> [Bool] {
        // 처음에는 모든 수를 소수(true)라고 가정
        var isPrime = [Bool](repeating: true, count: max + 1)
        isPrime[0] = false
        isPrime[1] = false
        
        // 2부터 sqrt(max)까지 각 수 i에 대해 i의 배수를 소수에서 제외
        let sqrtMax = Int(Double(max).squareRoot())
        for i in 2...sqrtMax {
            if isPrime[i] {
                for multiple in stride(from: i * i, through: max, by: i) {
                    isPrime[multiple] = false
                }
            }
        }
        return isPrime
    }
}
