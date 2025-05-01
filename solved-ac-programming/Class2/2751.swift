//
//  2751.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 5/1/25.
//

/*
 2751 | 수 정렬하기2
 
 문제:
 N개의 수가 주어졌을 때, 이를 오름차순으로 정렬하는 프로그램을 작성하시오.

 입력:
 첫째 줄에 수의 개수 N(1 ≤ N ≤ 1,000,000)이 주어진다. 둘째 줄부터 N개의 줄에는 수가 주어진다. 이 수는 절댓값이 1,000,000보다 작거나 같은 정수이다. 수는 중복되지 않는다.

 출력:
 첫째 줄부터 N개의 줄에 오름차순으로 정렬한 결과를 한 줄에 하나씩 출력한다.

 예제 입력 1:
 5
 5
 4
 3
 2
 1
 예제 출력 1:
 1
 2
 3
 4
 5
 
 비슷한 문제:
 2750번. 수 정렬하기
 10989번. 수 정렬하기 3
 
 알고리즘 분류:
 정렬
 */

import Foundation

func p2751() {
    let totalCount = Int(readLine()!)!
    var array = [Int]()

    for _ in 0..<totalCount {
        if let inputElement = Int(readLine()!) {
            array.append(inputElement)
        }
    }
    let result = mergeSort(array)
    result.map { print("\($0)") }


    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        return merge(leftArray, rightArray)
    }

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var result = [Int]()
        var leftIndex = 0, rightIndex = 0
        
        while leftIndex < left.count, rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                result.append(left[leftIndex])
                leftIndex += 1
            } else {
                result.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        result += left[leftIndex...]
        result += right[rightIndex...]
        
        return result
    }
}
