//
//  LastTextBaseline.swift
//  MyBabyApp
//
//  Created by YoonieMac on 7/2/26.
//

import SwiftUI

struct LastTextBaseline: View {
    var body: some View {
		ZStack {
			Color.pink.opacity(0.1)
				.ignoresSafeArea()
			
			VStack(spacing: 0) {
				Spacer()
				HStack(alignment: .lastTextBaseline) {
					Text("₩")
						.font(.system(size: 48, weight: .semibold, design: .rounded))
					Text("12,900")
						.font(.system(size: 72, weight: .ultraLight, design: .rounded))
					Text("/월")
						.font(.system(size: 36, weight: .regular, design: .rounded))
				}
				
				Spacer()
				
				HStack(alignment: .center) {
					Text("₩")
						.font(.system(size: 48, weight: .semibold, design: .rounded))
					Text("12,900")
						.font(.system(size: 72, weight: .ultraLight, design: .rounded))
					Text("/월")
						.font(.system(size: 36, weight: .regular, design: .rounded))
				}
				
				Spacer()
			}
		}
    }
}

#Preview {
    LastTextBaseline()
}
