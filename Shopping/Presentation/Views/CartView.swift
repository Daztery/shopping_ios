//
//  CartView.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

import SwiftData
import SwiftUI


enum FieldFocus: Hashable{
    case name, price, amount
}

struct CartView: View {
    @Environment(\.modelContext) private var modelContext

    @StateObject private var viewModel: CartViewModel

    @State private var name = ""
    @State private var price = ""
    @State private var amount = ""
    @FocusState private var focusedField: FieldFocus?
    @State private var showAlert = false

    init(container: AppContainer) {
        let vm = CartViewModel(
            addUseCase: container.addProductUseCase,
            getUseCase: container.getAllProductsUseCase,
            deleteUseCase: container.deleteProductUseCase,
            updateUseCase: container.updateProductUseCase,
            deleteAllUseCase: container.deleteAllProductsUseCase
        )
        _viewModel = StateObject(wrappedValue: vm)
    }

    var body: some View {
        VStack {
            Text("Total S/. \(viewModel.total, specifier: "%.2f")")
                .font(.title)
                .padding()
            List {
                ForEach(viewModel.products, id: \.id) { product in
                    HStack {
                        Text("\(product.amount) - \(product.name) ")
                        Spacer()
                        Text("S/. \(product.price, specifier: "%.2f")")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        let pair = viewModel.selectForEdit(product)
                        name  = pair.name
                        price = pair.price
                        focusedField = .price
                    }
                }
                .onDelete(perform: viewModel.deleteProduct)
            }

            TextField("Producto", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
                .focused($focusedField, equals: .name)
            
            TextField("Cantidad", text: $amount)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding()
                .focused($focusedField, equals: .amount)

            TextField("Precio", text: $price)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding()
                .focused($focusedField, equals: .price)

            Button(viewModel.editingProductID == nil ? "Agregar"
                                                     : "Actualizar") {
                if let p = Double(price) {
                    viewModel.save(name: name, price: p, amount: Int(amount) ?? 1)
                    name = ""
                    price = ""
                    amount = ""
                    focusedField = nil
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Limpiar Todo") {
                    showAlert =  true
                }
            }
        }
        .alert("¿Borrar todos los productos?", isPresented: $showAlert) {
            Button("Cancelar", role: .cancel) { }
            Button("Eliminar", role: .destructive) {
                viewModel.clearAll()
            }
        } message: {
            Text("Esta acción no se puede deshacer.")
        }
        .onAppear {
            viewModel.loadProducts()
        }
    }

}
