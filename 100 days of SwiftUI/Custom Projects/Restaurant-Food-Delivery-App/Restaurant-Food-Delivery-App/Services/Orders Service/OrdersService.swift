//
//  OrdersService.swift
//  Restaurant-Food-Delivery-App
//
//  Created by Tino Krzelj on 30/04/2023.
//

import Foundation
import Combine

class OrderService: OrdersServiceContract, ObservableObject {
    
    // MARK: - OrdersService Protocol
    
    @Published var activeOrders: [Order]
    @Published var archivedOrders: [Order]
    
    func addOrder(_ order: Order) {
        guard activeOrders.contains(where: { $0.id == order.id }) else { return }
        activeOrders.append(order)
    }
    
    @discardableResult
    func removeOrder(atOffset offset: IndexSet) -> Order? {
        guard let orderId = offset.map({ activeOrders[$0].id }).first else { return nil }
        guard let order = activeOrders.first(where: { $0.id == orderId }) else { return nil }
        activeOrders.remove(atOffsets: offset)
        return order
    }
    
    func moveOrderToArchived(atOffset offset: IndexSet) {
        guard let removedOrder = removeOrder(atOffset: offset) else { return }
        archivedOrders.append(removedOrder)
    }
    
    // MARK: - Object's Lifecycle
    
    init() {
        activeOrders = []
        archivedOrders = []
    }
    
}
