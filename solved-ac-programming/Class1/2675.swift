//
//  2675.swift
//  solved-ac-programming
//
//  Created by Hans Yim on 7/13/24.
//

/*
 2675 | 문자열 반복
 
 문제:
 문자열 S를 입력받은 후에, 각 문자를 R번 반복해 새 문자열 P를 만든 후 출력하는 프로그램을 작성하시오.
 즉, 첫 번째 문자를 R번 반복하고, 두 번째 문자를 R번 반복하는 식으로 P를 만들면 된다. S에는 QR Code "alphanumeric" 문자만 들어있다.
 QR Code "alphanumeric" 문자는 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ\$%*+-./: 이다.
 
 입력:
 첫째 줄에 테스트 케이스의 개수 T(1 ≤ T ≤ 1,000)가 주어진다.
 각 테스트 케이스는 반복 횟수 R(1 ≤ R ≤ 8), 문자열 S가 공백으로 구분되어 주어진다.
 S의 길이는 적어도 1이며, 20글자를 넘지 않는다.
 
 출력:
 각 테스트 케이스에 대해 P를 출력한다.
 
 예제 입력:
 2
 3 ABC
 5 /HTP
 
 예제 출력:
 AAABBBCCC
 /////HHHHHTTTTTPPPPP
 */


func readInput() -> ([(String, String)])? {
    guard let T = readLine(), let testcaseCount = Int(T) else {
        return nil
    }
    var currentCount = 0
    var inputs = [(String, String)]()
    
    while(currentCount < testcaseCount) {
        guard let input = readLine() else { return nil }
        let components = input.split(separator: " ")
        inputs.append((String(components[0]), String(components[1])))
        
        currentCount += 1
    }
    return (inputs)
}

if let inputs = readInput() {
    
    for input in inputs {
        
        var outputLine = ""
        let repeatition = Int(input.0)!
        let characters = Array(input.1)
        
        for character in characters {
            let multiplied = String(Array(repeating: character, count: repeatition))
            outputLine.append(multiplied)
        }
        print(outputLine)
    }
}



/*
 결과     정답
 메모리    69108 KB
 시간     8 ms
 코드길이  883 B
 */
