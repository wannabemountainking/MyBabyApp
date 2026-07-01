//
//  ContentView.swift
//  MyBabyApp
//
//  Created by YoonieMac on 6/28/26.
//

import SwiftUI

struct ContentView: View {
	@State private var vm: ThemeManager = .init()
	
    var body: some View {
        ChildView()
			.environment(vm)
    }
}

#Preview {
    ContentView()
}
