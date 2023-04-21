//
//  String+Extension.swift
//  Challenge-1
//
//  Created by Tino Krzelj on 18/04/2023.
//

import Foundation

extension String {
    var timeConversionRounded: Self {
        let doubleValue = Double(self) ?? 0.0
        if floor(doubleValue) == doubleValue {
            return String(format: "%.0f", doubleValue)
        }
        return String(format: "%.8f", doubleValue)
    }
}
