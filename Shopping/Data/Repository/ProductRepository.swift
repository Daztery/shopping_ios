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
    
    func addProduct(name: String, price: Double, amount: Int) {
        let product = ProductModel(name: name, price: price, amount: amount)
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
    
    func updateProduct(id: UUID, newName: String, newPrice: Double, newAmount: Int) {
        if let product = try? context.fetch(
               FetchDescriptor<ProductModel>(predicate: #Predicate { $0.id == id })
           ).first {
            product.name = newName
            product.price = newPrice
            product.amount = newAmount
            try? context.save()
        }
    }
    
    
    func deleteAll() {
        let descriptor = FetchDescriptor<ProductModel>()
        if let all = try? context.fetch(descriptor){
            for item in all {context.delete(item)}
            try? context.save()
        }
    }
}
