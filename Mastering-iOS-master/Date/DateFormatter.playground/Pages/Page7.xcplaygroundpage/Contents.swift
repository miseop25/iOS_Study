//: [Previous](@previous)

import Foundation

let startDate = Date()
let endDate = startDate.addingTimeInterval(3600 * 24 * 3)

let formatter = DateFormatter()
formatter.locale = Locale(identifier: "ko_KR")
formatter.dateStyle = .long
formatter.timeStyle = .short

print("\(formatter.string(from: startDate)) - \(formatter.string(from: endDate))")


let intervaFormatter = DateIntervalFormatter()
intervaFormatter.locale = Locale(identifier: "ko_KR")
//intervaFormatter.dateStyle = .long
//intervaFormatter.timeStyle = .short
intervaFormatter.dateTemplate = "yyyyMMMdE"

let result = intervaFormatter.string(from: startDate, to : endDate)
print(result)


//: [Next](@next)
