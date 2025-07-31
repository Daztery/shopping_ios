//
//  CartViewModel.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    
    private let addUseCase: AddProductUseCase
    private let getUseCase: GetAllProductsUseCase
    private let deleteUseCase: DeleteProductUseCase
    
    init(addUseCase: AddProductUseCase, getUseCase: GetAllProductsUseCase, deleteUseCase: DeleteProductUseCase) {
        self.addUseCase = addUseCase
        self.getUseCase = getUseCase
        self.deleteUseCase = deleteUseCase
        loadProducts()
    }
    
    
    func loadProducts() {
        products = getUseCase.execute()
    }
    
    func addProduct(name: String, price: Double) {
        addUseCase.execute(name: name, price: price)
        loadProducts()
    }
    
    func deleteProduct(at offsets: IndexSet) {
        for index in offsets {
            deleteUseCase.execute(product: products[index])
        }
        loadProducts()
    }
    
    var total: Double {
        products.reduce(0) { $0 + $1.price }
    }
    
}
