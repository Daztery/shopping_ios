//
//  ShoppingApp.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

import SwiftData
import SwiftUI

@main
struct ShoppingApp: App {

    var body: some Scene {
        WindowGroup {
            AppContainerView()
        }.modelContainer(for: ProductModel.self)
    }
}
