//
//  Order.swift
//  Restaurant-Food-Delivery-App
//
//  Created by Tino Krzelj on 30/04/2023.
//

import Foundation

struct Order: Identifiable, Codable, Equatable {
    let id: UUID
    let name: String
    let date: Date
    
    static let mock = Order(id: UUID(), name: "Mock Order+\(Date.timeIntervalBetween1970AndReferenceDate)", date: Date())
}
