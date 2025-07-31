//
//  AddProductUseCase.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

class AddProductUseCase {
    private let repository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(name: String, price: Double){
        repository.addProduct(name: name, price: price)
    }
}
