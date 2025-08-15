//
//  Product.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

import Foundation
import SwiftData

@Model
class ProductModel {
    var id: UUID
    var name: String
    var unitPrice: Double
    var quantity: Int

    init(id: UUID = UUID(), name: String, unitPrice: Double, quantity: Int) {
        self.id = id
        self.name = name
        self.unitPrice = unitPrice
        self.quantity = quantity
    }

    var subTotal: Double { unitPrice * Double(quantity) }
}
