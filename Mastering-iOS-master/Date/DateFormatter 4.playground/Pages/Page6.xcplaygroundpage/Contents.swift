//: [Previous](@previous)

import Foundation

let str = "2017-09-02"

// 이렇게 하면 웹서버와 문제없이 날짜를 주고받을 수 있다.
let formatter = ISO8601DateFormatter()
//formatter.formatOptions = [.withYear, .withMonth, .withDay, .withDashSeparatorInDate]
formatter.formatOptions = [.withFullDate]



if let date = formatter.date(from: str) {
    print(formatter.string(from: date))
}else {
    print("invalid format")
}





//: [Next](@next)
