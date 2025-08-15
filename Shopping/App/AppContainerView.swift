//
//  AppContainerView.swift
//  Shopping
//
//  Created by Andres Lopez on 30/07/25.
//

import SwiftData
import SwiftUI

struct AppContainerView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        let container = AppContainer(modelContext: modelContext)
        NavigationStack {
            CartView(container: container)
        }
    }
}
