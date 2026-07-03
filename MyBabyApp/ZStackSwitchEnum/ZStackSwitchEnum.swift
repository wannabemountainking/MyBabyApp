//
//  ZStackSwitchEnum.swift
//  MyBabyApp
//
//  Created by YoonieMac on 7/2/26.
//

import SwiftUI


enum Tab {
	case profile, settings, about
}

struct ZStackSwitchEnum: View {
	
	@State private var tab: Tab = .profile
	
    var body: some View {
		ZStack {
			switch tab {
			case .profile:
				YourView {
					Text("ProfileView")
						.transition(.move(edge: .top))
				}
			case .settings:
				YourView {
					Text("SettingsView")
						.transition(.move(edge: .bottom))
				}
			case .about:
				YourView {
					Text("AboutView")
						.transition(.move(edge: .leading))
				}
			}
		}
		.animation(.easeInOut(duration: 1), value: tab)
		.toolbar {
			ToolbarItem(placement: .bottomBar) {
				Button("profile", systemImage: "person") {
					tab = .profile
				}
			}
			ToolbarItem(placement: .bottomBar) {
				Button("settings", systemImage: "gear") {
					tab = .settings
				}
			}
			ToolbarItem(placement: .bottomBar) {
				Button("about", systemImage: "info") {
					tab = .about
				}
			}
		}
    }
}

struct YourView<Content: View>: View {
	let content: Content
	
	init(@ViewBuilder content: () -> Content) {
		self.content = content()
	}
	
	var body: some View {
		content
			.font(.largeTitle)
			.fontWeight(.bold)
			.foregroundStyle(.indigo)
	}
	
}

#Preview {
    ZStackSwitchEnum()
}
