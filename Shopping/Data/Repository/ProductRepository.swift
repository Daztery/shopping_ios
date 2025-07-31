//
//  ProductRepository.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

import Foundation
import SwiftData

class ProductRepository: ProductRepositoryProtocol{
    private let context:  ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addProduct(name: String, price: Double) {
        let product = ProductModel(name: name, price: price)
        context.insert(product)
        try? context.save()
    }
    
    func getAllProducts() -> [ProductModel] {
        let descriptor = FetchDescriptor<ProductModel>()
        return (try? context.fetch(descriptor)) ?? []
    }
    
    func deleteProduct(_ product: ProductModel) {
        context.delete(product)
        try? context.save()
    }
    
    
}
