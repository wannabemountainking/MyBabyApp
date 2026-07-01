//
//  StrokeBorder.swift
//  MyBabyApp
//
//  Created by YoonieMac on 6/30/26.
//

import SwiftUI

struct StrokeBorder: View {
	
	@State private var isSelected: Bool = false
	
    var body: some View {
		ZStack {
			Color.pink.opacity(0.1)
				.ignoresSafeArea()
			VStack(spacing: 30) {
				Circle()
					.fill(isSelected ? Color.blue : .white)
					.strokeBorder(isSelected ? Color.blue : .gray, lineWidth: 3)
					.frame(width: 200, height: 200, alignment: .center)
					.animation(.easeInOut(duration: 1), value: isSelected)
				Button {
					//action
					isSelected.toggle()
				} label: {
					Text(isSelected ? "선택 해제" : "선택")
						.font(.headline)
						.fontWeight(.heavy)
						.frame(maxWidth: .infinity)
						.frame(height: 40)
						.foregroundStyle(.white)
						.background(Color.blue.opacity(0.8))
						.clipShape(RoundedRectangle(cornerRadius: 10))
						.padding(.horizontal, 20)
				}

			}
		}
    }
}

#Preview {
    StrokeBorder()
}


/*
 연습문제 ⭐️⭐️

다음 요구사항으로 "선택 버튼" 을 만들어봐요:

Circle() 모양
선택 안 됐을 때: 회색 strokeBorder, 안쪽 흰색
선택 됐을 때: 파란색 strokeBorder, 안쪽 파란색 (꽉 참)
@State 로 선택 상태 토글

swiftstruct SelectButton: View {
    @State private var isSelected = false
    // 짜보기!
}
 */
