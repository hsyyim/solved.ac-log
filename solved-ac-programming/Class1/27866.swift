//
//  main.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 7/11/24.
//

import Foundation

/*
 27866 | 문자와 문자열
 
 문제:
 단어 `S`와 정수 `i가 주어졌을 때, `S`의 `i`번째 글자를 출력하는 프로그램을 작성하시오.
 
 입력:
 첫째 줄에 영어 소문자와 대문자로만 이루어진 단어 `S`가 주어진다.단어의 길이는 최대 1,000이다.
 둘째 줄에 정수 `i`가 주어진다. (1 <= i <= S)
 
 출력:
 `S`의 `i`번째 글자를 출력한다.
 
 */

// 입력을 받기 위한 함수
func readInput() -> (String, Int)? {
    guard let word = readLine(), let indexString = readLine(), let index = Int(indexString) else {
        return nil
    }
    return (word, index)
}

if let (word, index) = readInput() {
    // 문자열 인덱스는 0부터 시작하므로, 입력된 인덱스에서 1을 뺀다.
    let adjustedIndex = word.index(word.startIndex, offsetBy: index - 1)
    let character = word[adjustedIndex]
    print(character)
}


/*
 결과     정답
 메모리    69100 KB
 시간     8 ms
 코드길이  464 B
 */
