import UIKit

let now = Date()
print(now)

let formater = DateFormatter()

formater.dateStyle = .full
formater.timeStyle = .medium
formater.locale = Locale(identifier: "ko_KR")

var result = formater.string(from: now)
print(result)

formater.string(from: now)

DateFormatter.localizedString(from: now, dateStyle: .medium, timeStyle: .short)

//: [Next](@next)
