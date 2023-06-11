//
//  TimeConversionService.swift
//  Challenge-1
//
//  Created by Tino Krzelj on 18/04/2023.
//

import Foundation

final class TimeConversionService: TimeConversionServiceContractor {
    
    // MARK: - TimeConversionServiceContractor
    
    func convertFromSeconds(value: String, to: TimeConversionType) -> String {
        guard let value = Double(value) else { return "--" }
        let measurement = Measurement(value: value, unit: UnitDuration.seconds)
        
        switch to {
        case .second: return "\(measurement.converted(to: .seconds))"
        case .minute: return "\(measurement.converted(to: .minutes))"
        case .hour: return "\(measurement.converted(to: .hours))"
        case .day: return "\(value/86400)"
        }
    }
    
    func convertFromMinutes(value: String, to: TimeConversionType) -> String {
        guard let value = Double(value) else { return "--" }
        let measurement = Measurement(value: value, unit: UnitDuration.minutes)
        
        switch to {
        case .second: return "\(measurement.converted(to: .seconds))"
        case .minute: return "\(measurement.converted(to: .minutes))"
        case .hour: return "\(measurement.converted(to: .hours))"
        case .day: return "\(value/1440)"
        }
    }
    
    func convertFromHours(value: String, to: TimeConversionType) -> String {
        guard let value = Double(value) else { return "--" }
        let measurement = Measurement(value: value, unit: UnitDuration.hours)
        
        switch to {
        case .second: return "\(measurement.converted(to: .seconds))"
        case .minute: return "\(measurement.converted(to: .minutes))"
        case .hour: return "\(measurement.converted(to: .hours))"
        case .day: return "\(value/24)"
        }
    }
    
    func convertFromDays(value: String, to: TimeConversionType) -> String {
        guard let value = Double(value) else { return "--" }
        switch to {
        case .second: return "\(value*86400)"
        case .minute: return "\(value*1440)"
        case .hour: return "\(value*24)"
        case .day: return "\(value)"
        }
    }
    
}
