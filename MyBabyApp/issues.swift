//
//  issues.swift
//  MyBabyApp
//
//  Created by YoonieMac on 6/30/26.
//

//비행기 모드에서도 볼 수 있게 한 번에 정리할게요! 😊

//---
/*
## 5. `enumerated()` — 인덱스, 값 동시 접근

### 개념
```swift
for (index, value) in array.enumerated() {
    print(index, value)
}
```
배열을 돌면서 **인덱스와 값을 동시에** 꺼내는 메서드예요. 값만 필요하면 `for value in array`, 인덱스도 필요하면 `enumerated()`.

`struct` 배열의 요소를 수정할 땐 꼭 인덱스로 접근해야 해요 (값 타입 복사 문제 때문에):
```swift
for (idx, item) in items.enumerated() where item.isDone == false {
    items[idx].isDone = true  // item.isDone = true 는 에러!
}
```

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

--- */
/*
## 6. `@escaping` 클로저

### 한 줄씩 설명
```swift
func keyButtonView(
    geo: GeometryProxy,
    key: Key,
    completion: @escaping () -> Void   // ← A
) -> some View {
    Button {
        completion()                    // ← B
    } label: { ... }
}
```

- **A**: `completion` 파라미터는 `keyButtonView` 함수가 끝난 뒤에도(즉 `Button` 의 `action` 클로저 안에서, 나중에 탭될 때) 실행돼야 해요. 함수 호출 시점엔 안 쓰고 **나중에** 쓰니까 `@escaping` 이 필요해요.
- **B**: 실제 탭이 일어났을 때 저장해뒀던 클로저가 실행돼요.

### `@escaping` 이 필요 없는 경우 (비교)
```swift
func makeCard(@ViewBuilder content: () -> some View) -> some View {
    content()   // 함수 안에서 즉시 호출하고 끝 → @escaping 불필요
}
```
**핵심 기준: 클로저가 함수 종료 후에도 "보관"되어 나중에 실행되는가?** 그렇다면 `@escaping`.

### 연습문제 ⭐️⭐️ (2개)

**문제 1**
```swift
func delayedGreeting(after seconds: Double, completion: ??? () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}
```
`???` 자리에 `@escaping` 이 필요한지 아닌지 판단하고, 이유를 한 문장으로 설명해봐요.

**문제 2**
아래 두 함수 중 `@escaping` 이 필요한 것에 직접 키워드를 붙여봐요.
```swift
// A
func runNow(action: () -> Void) {
    action()
}

// B
var savedAction: (() -> Void)?
func saveForLater(action: () -> Void) {
    savedAction = action
}
```

--- */
/*
## 7. `gridCellColumns()`

### 개념
`Grid` 의 `GridRow` 안에서 특정 셀이 **몇 칸을 차지할지** 지정하는 modifier예요.
```swift
Grid {
    GridRow {
        Text("A")
        Text("넓은 셀")
            .gridCellColumns(2)
        Text("D")
    }
}
```
주의: 전체 열 개수는 **가장 많은 셀을 가진 행** 기준으로 정해지고, `gridCellColumns` 는 그 안에서 차지하는 비율을 조정하는 거예요.

### 연습문제 ⭐️⭐️ (2개)

**문제 1**
4열 `Grid` 를 만들고 다음과 같이 배치해봐요:
```
[ 제목       (3칸)    ][닫기]
[A][B][C][D]
```

**문제 2**
`Key` 같은 enum에 `columnSpan: Int` computed property 를 만들어서, `gridCellColumns(key.columnSpan)` 으로 동적으로 칸 수가 결정되게 해봐요. (숫자=1칸, 특정 케이스=2칸)

---

## 8. `contentShape` — 터치 영역

### 개념
SwiftUI의 hit-testing(터치 인식)은 기본적으로 **콘텐츠 모양**을 따라가요. `Text` 만 있는 버튼은 텍스트 글자 크기만큼만 탭이 되고, 투명한 빈 공간은 탭이 안 돼요.

```swift
Button {
    action()
} label: {
    Text("확인")
        .frame(maxWidth: .infinity, maxHeight: .infinity)  // 콘텐츠 자체를 키움
        .contentShape(Rectangle())  // 터치 영역을 프레임 전체로 강제 지정
}
```

**핵심 두 가지 해결법:**
1. `label` 내부 콘텐츠에 `.frame(maxWidth: .infinity, maxHeight: .infinity)` → 콘텐츠 자체가 커지면서 터치 영역도 같이 커짐
2. `.contentShape(Rectangle())` → 명시적으로 "이 프레임 전체가 터치 영역" 이라고 선언

**주의**: 반드시 `Button` 의 `label:` 클로저 **안쪽**에 적용해야 해요. `Button` 밖에 붙이면 효과 없어요!

### 연습문제 ⭐️⭐️ (2개)

**문제 1**
아이콘 하나(`Image(systemName:)`)만 있는 작은 버튼을 만들고, 시각적으로는 24×24pt지만 터치 영역은 44×44pt가 되도록 해봐요. (힌트: padding + contentShape)

**문제 2**
`HStack` 안에 `Text` 와 `Spacer()` 가 있는 행 전체를 탭 가능하게 만들어봐요. `Spacer()` 부분을 탭해도 동작해야 해요.
```swift
HStack {
    Text("설정")
    Spacer()
    Image(systemName: "chevron.right")
}
// 이 전체 HStack을 탭 가능하게
```

---

## 9. `lastTextBaseline` 정렬

### 개념
`HStack` 의 `alignment` 옵션 중 하나로, 텍스트들의 **마지막 줄 베이스라인**(글자가 앉는 가상의 선)을 기준으로 정렬해요. 폰트 크기가 다른 텍스트들을 나란히 놓을 때 자연스러워 보여요.

```swift
HStack(alignment: .lastTextBaseline) {
    Text("13").font(.system(size: 60))
    Text("/ 15").font(.system(size: 24))
}
```
`.center` 로 하면 큰 글자와 작은 글자가 수직 중앙으로 맞춰져서 어색하게 떠 보이는데, `.lastTextBaseline` 은 글자 "밑선" 을 맞춰서 인쇄물처럼 자연스러워요.

```
.center 정렬:        .lastTextBaseline 정렬:
   13  / 15              13
  (어색하게 떠보임)        ̲ / 15  ← 밑선 맞음
```

### 연습문제 ⭐️⭐️ (2개)

**문제 1**
가격 표시 UI를 만들어봐요: `"₩"` (작은 글씨) + `"12,900"` (큰 글씨) + `"/월"` (작은 글씨) 를 `lastTextBaseline` 으로 자연스럽게 정렬.

**문제 2**
`.center` 정렬과 `.lastTextBaseline` 정렬 두 버전을 같은 화면에 나란히 만들어서 비교해봐요. (시각적 차이를 직접 확인)

---

## 10. `ZStack + switch(enum)` 화면 전환

### 개념
```swift
enum Screen { case home, detail, settings }

struct ContentView: View {
    @State private var screen: Screen = .home

    var body: some View {
        ZStack {
            switch screen {
            case .home: HomeView()
            case .detail: DetailView()
            case .settings: SettingsView()
            }
        }
        .animation(.easeInOut, value: screen)
    }
}
```
- `ZStack` 으로 감싸는 이유: `switch` 만 쓰면 화면이 바뀔 때 레이아웃이 들썩일 수 있어서, 같은 좌표계 안에서 자연스럽게 전환되게 해요.
- `.animation(value:)` 는 `screen` 값이 바뀔 때마다 자동으로 트랜지션을 적용해요. (값 자체가 `Equatable` 이어야 함)
- `NavigationStack` 과 달리 **뒤로가기 제스처가 없어서**, 게임처럼 흐름을 완전히 통제하고 싶을 때 적합해요.

### 연습문제 ⭐️⭐️⭐️ (2개)

**문제 1**
`enum Tab { case profile, settings, about }` 를 만들고, 하단에 버튼 3개로 탭 전환하는 `ZStack + switch` 구조를 짜봐요. 전환 시 `.opacity` 애니메이션이 보이게 해봐요.

**문제 2**
`enum OnboardingStep { case welcome, permissions, done }` 로 3단계 온보딩을 만들어봐요. "다음" 버튼을 누르면 `step` 이 진행되고, `done` 에 도달하면 "시작하기" 버튼만 보이게 해봐요.

---

## 11. 나머지 메서드/로직 — 메서드당 각 2문제

### `checkAnswer()` 패턴 (Optional.map으로 결과 계산)
```swift
let result: Bool? = Int(userInput).map { $0 == rightAnswer }
```

**문제 1**: 사용자가 입력한 `String` 이메일 형식인지(`@` 포함 여부)를 검사해서, 입력이 비어있으면 `nil`, 입력이 있으면 `Bool` 을 반환하는 함수를 `Optional.map` 으로 짜봐요.

**문제 2**: `Int(userInput)` 대신 `Double(userInput)` 을 받아서 `0보다 큰지` 를 판단하는 `result: Bool?` 로직을 짜봐요.

---

### `nextQuestion()` 패턴 (switch + case 범위로 흐름 제어)
```swift
switch idx {
case 0..<numberOfQuestions - 1: ...
case numberOfQuestions - 1: ...
default: ...
}
```

**문제 1**: 페이지네이션 로직을 만들어봐요. `currentPage` 가 `0..<totalPages-1` 이면 다음 페이지로, 마지막 페이지면 "완료" 처리하는 함수를 `switch` 로 짜봐요.

**문제 2**: 엘리베이터 층 이동 시뮬레이션을 만들어봐요. `currentFloor` 가 `1..<maxFloor` 면 위로 한 층, `maxFloor` 면 "옥상 도착" 메시지를 출력하는 `switch` 로직을 짜봐요.

---

### `retry()` 패턴 (filter로 부분집합 만들고 상태 리셋)
```swift
func retry() {
    retryQuestions = questions.filter { $0.isCorrect == false }
    for (idx, q) in questions.enumerated() where q.isCorrect == false {
        questions[idx].isCorrect = nil
    }
    ...
}
```

**문제 1**: 장바구니 배열에서 `isOutOfStock == true` 인 상품만 추려서 `outOfStockItems` 에 저장하고, 원본 배열에서 해당 상품들의 `quantity` 를 0으로 리셋하는 함수를 짜봐요.

**문제 2**: 시험 채점 시스템에서 `score < 60` 인 학생들만 `retakeList` 로 추출하고, 해당 학생들의 `score` 를 `nil` 로 리셋하는 함수를 짜봐요.

---

### `Color(hex:)` 패턴 (비트 연산으로 타입 변환)
```swift
let r = Double(intHex >> 16 & 0xFF) / 255
```

**문제 1**: `Int` 값 하나(`0xFF6B6B`)를 받아서 R, G, B 세 개의 `Int` (0~255) 튜플로 분리하는 함수를 비트 연산으로 짜봐요. (Color 없이 순수 로직만)

**문제 2**: 반대로 R, G, B 세 `Int` (0~255)를 받아서 `"#RRGGBB"` 형식의 16진수 문자열로 합치는 함수를 짜봐요. (힌트: `String(format:)` 또는 비트 시프트의 역연산)

---

다 정리됐어요! 비행기에서 천천히 풀어보고 도착하면 하나씩 같이 점검해봐요 ✈️😊
*/
