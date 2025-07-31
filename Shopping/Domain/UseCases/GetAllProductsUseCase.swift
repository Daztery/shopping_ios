//
//  GetAllProductsUseCase.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

class GetAllProductsUseCase {
    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }

    func execute() -> [ProductModel] {
        return repository.getAllProducts()
    }
}
