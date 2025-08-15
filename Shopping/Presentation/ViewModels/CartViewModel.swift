//
//  CartViewModel.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    @Published var editingProductID: UUID?
    @Published var showDeleteAllAlert: Bool = false
    
    private let addUseCase: AddProductUseCase
    private let getUseCase: GetAllProductsUseCase
    private let deleteUseCase: DeleteProductUseCase
    private let updateUseCase: UpdateProductUseCase
    private let deleteAllUseCase: DeleteAllProductsUseCase
    
    init(addUseCase: AddProductUseCase, getUseCase: GetAllProductsUseCase, deleteUseCase: DeleteProductUseCase, updateUseCase: UpdateProductUseCase, deleteAllUseCase: DeleteAllProductsUseCase) {
        self.addUseCase = addUseCase
        self.getUseCase = getUseCase
        self.deleteUseCase = deleteUseCase
        self.updateUseCase = updateUseCase
        self.deleteAllUseCase = deleteAllUseCase
        loadProducts()
    }
    
    
    func loadProducts() {
        products = getUseCase.execute()
    }
    
    func addProduct(name: String, price: Double, amount: Int) {
        addUseCase.execute(name: name, price: price, amount: amount)
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
    
    func selectForEdit(_ product: ProductModel) -> (name: String, price: String, amount: String) {
        editingProductID = product.id
        return (name: product.name, price: String(product.price), amount: String(product.amount))
    }
    
    func save(name: String, price: Double, amount: Int){
        if let id = editingProductID {
            updateUseCase.execute(id: id, name: name, price: price, amount: amount)
            editingProductID = nil
        } else {
            addUseCase.execute(name: name, price: price, amount: amount)
        }
        loadProducts()
    }
    
    func clearAll() {
        deleteAllUseCase.execute()
        loadProducts()
    }
    
}
