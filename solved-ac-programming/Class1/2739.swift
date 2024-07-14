//
//  2739.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 7/14/24.
//

/*
 2739 | 구구단
 
 문제:
 N을 입력받은 뒤, 구구단 N단을 출력하는 프로그램을 작성하시오. 출력 형식에 맞춰서 출력하면 된다.
 
 입력:
 첫째 줄에 N이 주어진다. N은 1보다 크거나 같고, 9보다 작거나 같다.
 
 출력:
 출력형식과 같게 N*1부터 N*9까지 출력한다.
 
 */

if let input = readLine(), let number = Int(input) {
    for n in 1...9 {
        let multiplied = number * n
        print("\(number) * \(n) = \(multiplied)")
    }
}



/*
 결과     정답
 메모리    69100 KB
 시간     8 ms
 코드길이  167 B
 */
