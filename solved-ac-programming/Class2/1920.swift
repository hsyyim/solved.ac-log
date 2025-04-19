//
//  1920.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 4/13/25.
//

/*
 1920 | 수 찾기
 
 문제
 N개의 정수 A[1], A[2], …, A[N]이 주어져 있을 때, 이 안에 X라는 정수가 존재하는지 알아내는 프로그램을 작성하시오.

 입력
 첫째 줄에 자연수 N(1 ≤ N ≤ 100,000)이 주어진다. 다음 줄에는 N개의 정수 A[1], A[2], …, A[N]이 주어진다. 다음 줄에는 M(1 ≤ M ≤ 100,000)이 주어진다. 다음 줄에는 M개의 수들이 주어지는데, 이 수들이 A안에 존재하는지 알아내면 된다. 모든 정수의 범위는 -231 보다 크거나 같고 231보다 작다.

 출력
 M개의 줄에 답을 출력한다. 존재하면 1을, 존재하지 않으면 0을 출력한다.

 예제 입력 1
 5
 4 1 5 2 3
 5
 1 3 7 9 5
 예제 출력 1
 1
 1
 0
 0
 1
 출처
 데이터를 추가한 사람: BaaaaaaaaaaarkingDog, djm03178, melthetensai
 문제의 오타를 찾은 사람: bupjae
 잘못된 데이터를 찾은 사람: tncks0121
 
 알고리즘 분류
 자료 구조
 정렬
 이분 탐색
 해시를 사용한 집합과 맵
 
 이분 탐색 또는 Set을 이용한 빠른 검색 구현
 시간복잡도:
 - 이분 탐색: O(N log N + M log N)
 - Set 활용: O(N + M)
 
 */

// MARK: - 해시셋을 활용한 구현
func solveWithSet() {
    let _ = readLine()!
    let referenceNumbers = Set(readLine()!.split(separator: " ").map { Int($0)! })

    let _ = readLine()!
    let numbersToFind = readLine()!.split(separator: " ").map { Int($0)! }

    for number in numbersToFind {
        print("\(referenceNumbers.contains(number) ? "1" : "0")")
    }
}

// MARK: - 이분 탐색을 활용한 구현
func solveWithBinarySearch() {
    let _ = readLine()!
    var referenceNumbers = readLine()!.split(separator: " ").map { Int($0)! }
    referenceNumbers.sort()
    
    let _ = readLine()!
    let numbersToFind = readLine()!.split(separator: " ").map { Int($0)! }
    
    for number in numbersToFind {
        print("\(binarySearch(referenceNumbers, number) ? "1" : "0")")
    }
}
// 이분 탐색 함수
func binarySearch(_ sortedArray: [Int], _ target: Int) -> Bool {
    var left = 0
    var right = sortedArray.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if sortedArray[mid] == target {
            return true
        } else if sortedArray[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return false
}
