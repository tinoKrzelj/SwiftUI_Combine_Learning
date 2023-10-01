//
//  OrderServiceProtocol.swift
//  Restaurant-Food-Delivery-App
//
//  Created by Tino Krzelj on 30/04/2023.
//

import Foundation

protocol OrdersServiceContract {
    var activeOrders: [Order] { get set }
    var archivedOrders: [Order] { get set }
    func addOrder(_ order: Order)
    func removeOrder(atOffset offset: IndexSet) -> Order?
    func moveOrderToArchived(atOffset offset: IndexSet)
}
