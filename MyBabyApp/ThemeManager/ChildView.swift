//
//  ChildView.swift
//  MyBabyApp
//
//  Created by YoonieMac on 6/29/26.
//

import SwiftUI

struct ChildView: View {
	
	@Environment(ThemeManager.self) private var themeManager
	
    var body: some View {
		ZStack {
			themeManager.primaryColor.ignoresSafeArea()
		}
    }
}

#Preview {
    ChildView()
		.environment(ThemeManager())
}
