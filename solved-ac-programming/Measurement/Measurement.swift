//
//  Measurement.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 4/7/25.
//

import Foundation

// MARK: - 성능 측정 함수
func measureTime(title: String, operation: () -> Void) {
    let start = DispatchTime.now()
    operation()
    let end = DispatchTime.now()
    let elapsed = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000.0
    print("\(title) - 소요 시간: \(elapsed)초")
}

// MARK: - 통계 처리용 벤치마크 함수
/// 여러 번의 실행 결과를 모아 평균, 표준편차, 최소/최대 시간을 출력합니다.
func measureTimeStats(title: String, runs: Int, operation: () -> Void) {
    var times: [Double] = []
    for _ in 0..<runs {
        let start = DispatchTime.now()
        operation()
        let end = DispatchTime.now()
        let elapsed = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000.0
        times.append(elapsed)
    }
    let sum = times.reduce(0, +)
    let mean = sum / Double(runs)
    let variance = times.reduce(0, { $0 + pow($1 - mean, 2) }) / Double(runs)
    let stdDev = sqrt(variance)
    let minTime = times.min()!
    let maxTime = times.max()!
    
    print("\(title) - \(runs)회, 평균: \(mean)초, 표준편차: \(stdDev)초, 최소: \(minTime)초, 최대: \(maxTime)초")
}
