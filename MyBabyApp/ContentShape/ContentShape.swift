//
//  ContentShape.swift
//  MyBabyApp
//
//  Created by YoonieMac on 7/1/26.
//

import SwiftUI

struct ContentShape: View {
    var body: some View {
		Button(
			"write",
			systemImage: "pencil.and.outline",
			action: { print("작동")}
		)
		.frame(width: 24, height: 24)
		.foregroundStyle(Gradient(colors: [.pink, .green]))
		.background(Color.yellow)
		.padding(20)
		.contentShape(
			Rectangle()
		)
		.buttonStyle(.plain)
    }
}

#Preview {
    ContentShape()
}
