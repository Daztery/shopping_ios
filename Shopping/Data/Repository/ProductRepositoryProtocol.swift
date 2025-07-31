//
//  ProductRepositoryProtocol.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

import Foundation

protocol ProductRepositoryProtocol {
    func addProduct(name: String, price: Double)
    func getAllProducts() -> [ProductModel]
    func deleteProduct(_ product: ProductModel)
}
