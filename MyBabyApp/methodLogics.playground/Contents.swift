import UIKit


func isInputEmail(userInput: String) -> Bool? {
	
	userInput.isEmpty ? nil : userInput.contains("@")
//
//	let input = userInput.isEmpty ? nil : userInput
//	if let result = input.map({ $0.contains("@") }) {
//		return result
//	} else {
//		return nil
//	}
	
	
}

//print(isInputEmail(userInput: "asd@adffd"))


func isBiggerThanZero(userInput: String) -> Bool? {
	Double(userInput).map { $0 > 0 }
}
//print(isBiggerThanZero(userInput: "a;lkidjf"))


func pagenations(currentPage: Int, totalPages: Int) -> String {
	guard currentPage >= 0 && currentPage < totalPages else {return "유효하지 않은 페이지" }
	switch currentPage {
		case 0..<totalPages - 1: return "다음 페이지로"
		case totalPages - 1: return "완료"
		default: return "예상치 못한 경우"
	}
}
//
//print(pagenations(currentPage: 48, totalPages: 11))
//print(pagenations(currentPage: 10, totalPages: 11))

func movingElevator(currentFloor: Int, maxFloor: Int) -> String {
	guard currentFloor >= 1 && currentFloor <= maxFloor else {return "유효하지 않은 층" }
	switch currentFloor {
		case 1..<maxFloor: return "위로 한 층"
		case maxFloor: return "옥상 도착"
		default: return "예상치 못한 경우"
	}
}
//
//print(movingElevator(currentFloor: 77, maxFloor: 47))
//print(movingElevator(currentFloor: 109, maxFloor: 109))


struct Product {
	var isOutOfStock: Bool
	var quantity: Int
}

var outOfStockItems: [Product] = []
var cart: [Product] = [
	Product(isOutOfStock: false, quantity: 4),
	Product(isOutOfStock: true, quantity: 76),
	Product(isOutOfStock: false, quantity: 2),
	Product(isOutOfStock: true, quantity: 9),
	Product(isOutOfStock: false, quantity: 11),
	Product(isOutOfStock: true, quantity: 26),
]
@MainActor
func numberOfPresentGoods() {
	outOfStockItems = cart.filter { $0.isOutOfStock == true }
	for (idx, item) in cart.enumerated() where item.isOutOfStock == true {
		cart[idx].quantity = 0
	}
}
//
//numberOfPresentGoods()
//print(outOfStockItems)


struct Student {
	var score: Int?
}

var students: [Student] = [
	Student(score: 55),
	Student(score: 98),
	Student(score: 33),
	Student(score: 77),
	Student(score: 64),
	Student(score: 1),
]

var retakeList: [Student] = []

@MainActor
func resetScore() {
	retakeList = students.filter({ $0.score ?? 100 < 60 })
	for (idx, student) in students.enumerated() where student.score ?? 0 < 60 {
		students[idx].score = nil
	}
}

//resetScore()
//print(retakeList)
//print(students)


func switchToDecimal(hex: String) -> (r: Int, g: Int, b: Int) {
	guard let intHex = Int(hex.trimmingCharacters(in: CharacterSet(charactersIn: "#")), radix: 16) else { fatalError("잘못된 값 입력") }
	let red = intHex >> 16 & 0xFF
	let green = intHex >> 8 & 0xFF
	let blue = intHex & 0xFF
	return (r: red, g: green, b: blue)
}

print(switchToDecimal(hex: "#FF6B6B"))

func toHexString(r: Int, g: Int, b: Int) -> String {
	let intHex = r << 16 | g << 8 | b << 0
	return String(format: "#%06X", intHex)
}
print(toHexString(r: 255, g: 107, b: 107))
