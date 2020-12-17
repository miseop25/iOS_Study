//: [Previous](@previous)


import UIKit

let now = Date()
let formatter = DateFormatter()


formatter.setLocalizedDateFormatFromTemplate("yyyyMMMMdE")

formatter.locale = Locale(identifier: "en_US")
var result = formatter.string(from: now)


formatter.locale = Locale(identifier: "ko_KO")
formatter.setLocalizedDateFormatFromTemplate("yyyyMMMMdE")
result = formatter.string(from: now)
print(formatter.dateFormat)

formatter.dateFormat = "yyyyMMMMde"
result = formatter.string(from: now)

//: [Next](@next)
