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
					Text(
				case .permissions:
					<#code#>
				case .done:
					<#code#>
				}
			}
		}
    }
}

#Preview {
    OnBoarding()
}
