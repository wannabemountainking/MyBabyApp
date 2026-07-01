import UIKit
/*
### 연습문제 ⭐️⭐️ (3개)

**문제 1**
```swift
let fruits = ["사과", "바나나", "포도", "딸기"]
```
인덱스가 짝수인 과일만 `"[인덱스] 이름"` 형태로 출력해봐요.

**문제 2**
```swift
struct Todo {
	var title: String
	var isDone: Bool
}
var todos = [
	Todo(title: "청소", isDone: false),
	Todo(title: "빨래", isDone: true),
	Todo(title: "공부", isDone: false)
]
```
`enumerated()` 를 써서 `isDone == false` 인 항목들을 전부 `true` 로 바꿔봐요.

**문제 3**
```swift
let scores = [55, 90, 70, 100, 40]
```
60점 미만인 점수들의 **인덱스**만 모아서 배열로 만들어봐요. (`[0, 4]` 가 나와야 해요)
*/

let fruits = ["사과", "바나나", "포도", "딸기"]

for (index, fruit) in fruits.enumerated() where index % 2 == 0 {
//	print("[\(index)] \(fruit)")
}

struct Todo {
	var title: String
	var isDone: Bool
}
var todos = [
	Todo(title: "청소", isDone: false),
	Todo(title: "빨래", isDone: true),
	Todo(title: "공부", isDone: false)
]

for (index, todo) in todos.enumerated() where todo.isDone == false {
	todos[index].isDone = true
}
//print(todos)

let scores = [55, 90, 70, 100, 40]

var indices: [Int] = []
for (index, score) in scores.enumerated() where score < 60 {
	indices.append(index)
}
//print(indices)
