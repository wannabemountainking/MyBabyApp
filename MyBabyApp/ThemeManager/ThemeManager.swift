//
//  ThemeManager.swift
//  MyBabyApp
//
//  Created by YoonieMac on 6/29/26.
//

import Foundation
import SwiftUI
import Observation


@Observable
final class ThemeManager {
	var primaryColor: Color
	
	init(primaryColor: Color = Color.pink.opacity(0.5)) {
		self.primaryColor = primaryColor
	}
}
