//
//  AddProductUseCase.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//
import Foundation

class UpdateProductUseCase {
    private let repository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: UUID, name: String, price: Double, amount: Int){
        repository.updateProduct(id: id, newName: name, newPrice: price, newAmount: amount)
    }
}
