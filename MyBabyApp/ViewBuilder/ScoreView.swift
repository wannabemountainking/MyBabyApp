//
//  ScoreView.swift
//  MyBabyApp
//
//  Created by YoonieMac on 6/29/26.
//

import SwiftUI

struct ScoreView: View {
    var body: some View {
		VStack {
			ForEach(1..<5) { _ in
				CardContainer(
					width: 300,
					height: 150,
					x: 20,
					y: 20,
					radius: 20,
					content: {
						Text("김이안")
							.font(.system(size: 48, weight: .black, design: .rounded))
							.kerning(10)
						
					}
				)
				.padding(20)
			}
		}
    }
}
struct CardContainer<Content: View>: View {
	
	let content: Content
	let width: CGFloat
	let height: CGFloat
	let x: CGFloat
	let y: CGFloat
	let radius: CGFloat
	
	init(width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat, radius: CGFloat, @ViewBuilder content: () -> Content) {
		self.width = width
		self.height = height
		self.x = x
		self.y = y
		self.radius = radius
		self.content = content()
	}
	
	var body: some View {
		RoundedRectangle(cornerRadius: 20)
			.frame(width: width, height: height)
			.foregroundStyle(Color.white)
			.overlay {
				content
			}
			.shadow(
				color: .gray.opacity(0.5),
				radius: radius,
				x: x,
				y: y
			)
	}
}
#Preview {
    ScoreView()
}
