//
//  OnBoarding.swift
//  MyBabyApp
//
//  Created by YoonieMac on 7/2/26.
//

import SwiftUI

enum OnboardingStep {
	case welcome, permissions, done
}

struct OnBoarding: View {
	
	@State private var onboardStep: OnboardingStep = .welcome
	
    var body: some View {
		ZStack {
			Color.pink.opacity(0.1)
			
			VStack {
				switch onboardStep {
				case .welcome:
					Button {
						//action
						onboardStep = .permissions
					} label: {
						Text("다음")
					}

				case .permissions:
					Text("permissions")
					Button {
						// action
						onboardStep = .done
					} label: {
						Text("다음")
					}

				case .done:
					Button {
						//action
						onboardStep = .welcome
					} label: {
						Text("시작하기")
					}

				}
			}
		}
    }
}

#Preview {
    OnBoarding()
}
