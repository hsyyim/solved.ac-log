//
//  11654.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 7/11/24.
//

import Foundation

/*
 11654 | 아스키코드
 
 문제:
 알파벳 소문자, 대문자, 숫자 0-9중 하나가 주어졌을 때, 주어진 글자의 아스키 코드값을 출력하는 프로그램을 작성하시오.
 
 입력:
 알파벳 소문자, 대문자, 숫자 0-9 중 하나가 첫째 줄에 주어진다.
 
 출력:
 입력으로 주어진 글자의 아스키 코드 값을 출력한다.
 
 */

func p11654() {
    var input = readLine()!

    let inputs = Array(input)

    func getAsciiCode(of input: Character) -> UInt8? {
        guard input.isASCII else { return nil }
        return input.asciiValue
    }

    if inputs.count == 1,
       let character = inputs.first,
       let asciiValue = getAsciiCode(of: character) {
        
        print("\(String(asciiValue))")
    }
}

/*
 결과     정답
 메모리    69096 KB
 시간     8 ms
 코드길이  324 B
 */
