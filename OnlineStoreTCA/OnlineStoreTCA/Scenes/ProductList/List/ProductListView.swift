//
//  ProductListView.swift
//  OnlineStoreTCA
//
//  Created by Gustavo Soares on 02/12/24.
//

import ComposableArchitecture
import SwiftUI

struct ProductListView: View {
    var store: StoreOf<ProductListDomain>

    var body: some View {
        NavigationView {
            Group {
                if store.isLoading {
                    ProgressView()
                        .frame(width: 100, height: 100)
                } else if store.shouldShowError {
                    EmptyView()
                } else {
                    List {
                        ForEach(
                            store.scope(
                                state: \.productList,
                                action: \.product
                            ),
                            id: \.id
                        ) { store in
                            ProductDetailsView(store: store)
                        }
                    }
                }
            }
            .task {
                store.send(.fetchProducts)
            }
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ProductListView(
        store: Store(
            initialState: ProductListDomain.State()
        ) {
            ProductListDomain()
        }
    )
}
