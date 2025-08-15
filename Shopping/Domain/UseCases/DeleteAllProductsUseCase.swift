//
//  DeleteProductUseCase.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

class DeleteAllProductsUseCase {
    private let repository: ProductRepositoryProtocol

    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }

    func execute() {
        repository.deleteAll()
    }
}
