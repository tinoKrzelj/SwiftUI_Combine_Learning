//
//  TimeConversionType.swift
//  Challenge-1
//
//  Created by Tino Krzelj on 18/04/2023.
//

import Foundation

enum TimeConversionType: CaseIterable {
    case second, minute, hour, day
    
    func stringValue() -> String {
        switch self {
        case .second: return "Seconds"
        case .minute: return "Minutes"
        case .hour: return "Hours"
        case .day: return "Days"
        }
    }
}
