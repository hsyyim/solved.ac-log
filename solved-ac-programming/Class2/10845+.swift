//
//  10845+.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 3/24/25.
//

import Foundation

/*
- removeFirst() 방식:
  - pop() 호출 시 O(n) 복사 비용 발생
  - 작은 데이터나 적은 호출 횟수에서는 큰 문제 없음
  - 데이터가 많아질수록 점진적으로 느려짐
  
- firstIndex 방식:
  - pop() 호출 시 O(1)로 빠름 (인덱스만 증가)
  - 일정 호출 후 배열 정리 시 대량 복사 비용 발생
  - 대규모 데이터에서 removeFirst()보다 훨씬 유리함
  
- 테스트 결과:
  - 소규모: 큰 차이 없음 또는 removeFirst()가 약간 더 빠른 경우도 있음
  - 대규모 (수십만 ~ 백만 단위):
    - firstIndex 방식이 removeFirst 대비 큰 성능 차이로 더 빠름
  - 최적화 포인트:
    - 정리 주기(frontIndex 기준 1000 등)와 배열 복사 타이밍 조절 가능
*/

// MARK: - removeFirst() 방식 큐
final class RemoveFirstQueue<T> {
    private var elements: [T] = []
    
    func push(_ element: T) {
        elements.append(element)
    }
    
    func pop() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
}

// MARK: - firstIndex 방식 큐
final class IndexQueue<T> {
    private var elements: [T] = []
    private var frontIndex = 0
    
    func push(_ element: T) {
        elements.append(element)
    }
    
    func pop() -> T? {
        guard frontIndex < elements.count else { return nil }
        let element = elements[frontIndex]
        frontIndex += 1
        if frontIndex > 1000 {
            elements = Array(elements[frontIndex...])
            frontIndex = 0
        }
        return element
    }
}

// MARK: - 성능 측정 함수
func measureTime(title: String, operation: () -> Void) {
    let start = DispatchTime.now()
    operation()
    let end = DispatchTime.now()
    let elapsed = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000.0
    print("\(title) - 소요 시간: \(elapsed)초")
}

// MARK: - 벤치마크 실행
func runBenchmark() {
    let elementCount = 100_000

    print("==== removeFirst() 기반 Queue 벤치마크 시작 ====")
    let removeFirstQueue = RemoveFirstQueue<Int>()
    for i in 0..<elementCount {
        removeFirstQueue.push(i)
    }
    measureTime(title: "removeFirstQueue pop \(elementCount)회") {
        for _ in 0..<elementCount {
            _ = removeFirstQueue.pop()
        }
    }

    print("\n==== firstIndex 기반 Queue 벤치마크 시작 ====")
    let indexQueue = IndexQueue<Int>()
    for i in 0..<elementCount {
        indexQueue.push(i)
    }
    measureTime(title: "indexQueue pop \(elementCount)회") {
        for _ in 0..<elementCount {
            _ = indexQueue.pop()
        }
    }

}
