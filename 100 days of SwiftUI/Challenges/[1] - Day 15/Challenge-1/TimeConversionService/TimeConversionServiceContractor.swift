//
//  TimeConversionServiceContractor.swift
//  Challenge-1
//
//  Created by Tino Krzelj on 18/04/2023.
//

import Foundation

protocol TimeConversionServiceContractor {
    func convertFromSeconds(value: String, to: TimeConversionType) -> String
    func convertFromMinutes(value: String, to: TimeConversionType) -> String
    func convertFromHours(value: String, to: TimeConversionType) -> String
    func convertFromDays(value: String, to: TimeConversionType) -> String
}
