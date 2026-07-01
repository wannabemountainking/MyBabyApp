//
//  GridCellColumns.swift
//  MyBabyApp
//
//  Created by YoonieMac on 6/30/26.
//

import SwiftUI


enum Key1 {
	case title(title: String, columns: Int)
	case closeButton(name: String)
	case key(char: String)
	
	var id: String {
		switch self {
		case .title(let title, _): return title
		case .closeButton(let name): return name
		case .key(let char): return char
		}
	}
	
	var columnSpan: Int {
		switch self {
		case .title(_, let columns): return columns
		case .closeButton: return 1
		case .key: return 1
		}
	}
}

struct GridCellColumns: View {
    var body: some View {
		
		let title = Key1.title(title: "GridCellColumns", columns: 3)
		let closeButton = Key1.closeButton(name: "닫기")
		let aBtn = Key1.key(char: "A")
		let bBtn = Key1.key(char: "B")
		let cBtn = Key1.key(char: "C")
		let dBtn = Key1.key(char: "D")
		
		Grid(horizontalSpacing: 20, verticalSpacing: 20) {
			GridRow {
				Text(title.id)
					.gridCellColumns(title.columnSpan)
					.foregroundStyle(.white)
					.frame(height: 60)
					.frame(maxWidth: .infinity)
					.background(Color.orange.opacity(0.7))
					.clipShape(RoundedRectangle(cornerRadius: 30))
					
				Button(closeButton.id) { }
					.frame(height: 60)
					.frame(maxWidth: .infinity)
					.foregroundStyle(.white)
					.background(Color.green.opacity(0.7))
					.clipShape(RoundedRectangle(cornerRadius: 30))
			}
			
			GridRow {
				ForEach([aBtn, bBtn, cBtn, dBtn], id: \.id) { char in
					RoundedRectangle(cornerRadius: 30)
						.fill(Color.pink.opacity(0.1))
						.frame(height: 60)
						.frame(maxWidth: .infinity)
						.overlay(content: {
							Text(char.id)
						})
						.shadow(color: .pink, radius: 5, x: 5, y: 5)
				}
			}
		}
		.padding(20)
    }
}

#Preview {
    GridCellColumns()
}


/*
### 연습문제 ⭐️⭐️ (2개)

**문제 1**
4열 `Grid` 를 만들고 다음과 같이 배치해봐요:
```
[ 제목       (3칸)    ][닫기]
[A][B][C][D]
```

**문제 2**
`Key` 같은 enum에 `columnSpan: Int` computed property 를 만들어서, `gridCellColumns(key.columnSpan)` 으로 동적으로 칸 수가 결정되게 해봐요. (숫자=1칸, 특정 케이스=2칸)

*/
