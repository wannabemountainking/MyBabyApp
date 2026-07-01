//
//  GridTraining.swift
//  MyBabyApp
//
//  Created by YoonieMac on 6/28/26.
//

import SwiftUI

enum Key: Identifiable, CaseIterable, Equatable {
	
	case digit(Int)
	case symbol(String)
	case decimalPoint(String)
	
	var id: String {
		switch self {
		case .digit(let num):
			return "\(num)"
		case .symbol(let symbol):
			return "\(symbol)"
		case .decimalPoint:
			return "."
		}
	}
	
	static var allCases: [Key] {
		var result = (1...9).map { self.digit($0) }
		result.insert(.symbol("➕"), at: 3)
		result.insert(.symbol("➖"), at: 7)
		result.insert(.symbol("✖️"), at: 11)
		result.insert(contentsOf: [.digit(0), .decimalPoint("."), .symbol("➗")], at: 12)
		return result
	}
	
	static func ==(lhs: Key, rhs: Key) -> Bool {
		lhs.id == rhs.id
	}
}

struct GridTraining: View {
	
	let rows: [[Key]] = stride(from: 0, to: Key.allCases.count, by: 4)
		.map { Array(Key.allCases[$0..<min($0 + 4, Key.allCases.count)]) }
	
    var body: some View {
		ZStack {
			Color.orange.opacity(0.5).ignoresSafeArea()
			
			
		}
	}
}


#Preview {
    GridTraining()
}
