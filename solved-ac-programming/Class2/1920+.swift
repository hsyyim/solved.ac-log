//
//  1920+.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 4/19/25.
//

/**
 10만 개의 랜덤 숫자를 포함하는 기준 배열 생성
 10만 개의 검색 대상 숫자 생성 (절반은 기준 배열에 있고, 절반은 없음)
 세 가지 방법으로 검색 테스트:
 Set.contains() - O(1) 해시 기반 검색
 이분 탐색 - O(log n)
 일반 배열의 contains() - O(n) (성능 비교를 위해 일부만 테스트)
 각 방법 10회 반복 실행하여 평균, 표준편차, 최소/최대 시간 측정
 
 SetSearch - 100회, 평균: 0.00050236468초, 표준편차: 1.6364131517975524e-05초, 최소: 0.000481421초, 최대: 0.000636127초
 BinarySearch - 100회, 평균: 0.0014339860499999995초, 표준편차: 3.7253556421736435e-05초, 최소: 0.001405597초, 최대: 0.001586214초
 containsSearch - 100회, 평균: 0.06466426042999998초, 표준편차: 0.0010032968574765623초, 최소: 0.062509664초, 최대: 0.066501384초
 */


func runPerformanceTest() {
    let referenceSize = 1_000
    let searchSize = 1_000
    
    let range = -231...231
    let referenceArray = (0..<referenceSize).map { _ in Int.random(in: range) }
    let sortedReferenceArray = referenceArray.sorted()
    let referenceSet = Set(referenceArray)
    
    var searchArray = [Int]()
    // 50:50 비율 랜덤 숫자 배열 생성
    for _ in 0..<searchSize {
        if let randomNumber = referenceArray.randomElement() {
            searchArray.append(randomNumber)
        }
    }
    for _ in 0..<searchSize {
        var randomNumber: Int
        repeat {
            randomNumber = Int.random(in: range)
        } while referenceSet.contains(randomNumber)
        searchArray.append(randomNumber)
    }
    
    // Set 탐색 테스트
    measureTimeStats(title: "SetSearch", runs: 100) {
        for number in searchArray {
            _ = referenceSet.contains(number)
        }
    }
    
    // 이분 탐색 테스트
    measureTimeStats(title: "BinarySearch", runs: 100) {
        for number in searchArray {
            _ = binarySearch(sortedReferenceArray, number)
        }
    }
    
    // 일반 배열 contains 메서드 테스트
    measureTimeStats(title: "containsSearch", runs: 100) {
        for number in searchArray.prefix(1000) {
            _ = referenceArray.contains(number)
        }
    }
}
