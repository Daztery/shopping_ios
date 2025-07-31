//
//  CartView.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

import SwiftData
import SwiftUI

struct CartView: View {
    @Environment(\.modelContext) private var modelContext

    @StateObject private var viewModel: CartViewModel

    @State private var name = ""
    @State private var price = ""

    init(container: AppContainer) {
        let vm = CartViewModel(
            addUseCase: container.addProductUseCase,
            getUseCase: container.getAllProductsUseCase,
            deleteUseCase: container.deleteProductUseCase
        )
        _viewModel = StateObject(wrappedValue: vm)
    }

    var body: some View {
        VStack {
            Text("Total S/. \(viewModel.total, specifier: "%.2f")")
                .font(.title)
                .padding()
            List {
                ForEach(viewModel.products) { product in
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text("S/. \(product.price, specifier: "%.2f")")
                    }
                }
                .onDelete(perform: viewModel.deleteProduct)
            }

            TextField("Producto", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()

            TextField("Precio", text: $price)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Agregar") {
                if let p = Double(price) {
                    viewModel.addProduct(name: name, price: p)
                    name = ""
                    price = ""
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
        .onAppear {
            viewModel.loadProducts()
        }
    }

}
