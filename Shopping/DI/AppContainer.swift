//
//  AppContainer.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

import Foundation
import SwiftData
import SwiftUICore

@MainActor
class AppContainer: ObservableObject {
    let productRepository: ProductRepositoryProtocol
    let addProductUseCase: AddProductUseCase
    let getAllProductsUseCase: GetAllProductsUseCase
    let deleteProductUseCase: DeleteProductUseCase
    let updateProductUseCase: UpdateProductUseCase
    let deleteAllProductsUseCase: DeleteAllProductsUseCase

    init(modelContext: ModelContext) {
        let repository = ProductRepository(context: modelContext)
        self.productRepository = repository
        self.addProductUseCase = AddProductUseCase(repository: repository)
        self.getAllProductsUseCase = GetAllProductsUseCase(repository: repository)
        self.deleteProductUseCase = DeleteProductUseCase(repository: repository)
        self.updateProductUseCase = UpdateProductUseCase(repository: repository)
        self.deleteAllProductsUseCase = DeleteAllProductsUseCase(repository: repository)
    }
}
