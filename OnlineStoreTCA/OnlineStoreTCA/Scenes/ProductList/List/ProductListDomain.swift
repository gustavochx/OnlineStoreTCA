//
//  ProductListDomain.swift
//  OnlineStoreTCA
//
//  Created by Gustavo Soares on 02/12/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct ProductListDomain {
    @ObservableState
    struct State: Equatable {
        var productList: IdentifiedArrayOf<ProductDomain.State> = []
        var isLoading = false
        var shouldShowError = false
    }

    enum Action: Equatable {
        case fetchProducts
        case fetchProductsResponse(TaskResult<[Product]>)
        case product(IdentifiedActionOf<ProductDomain>)
    }

    @Dependency(\.uuid) var uuid

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchProducts:
                // TODO: Threat load and integration
                return .run { send in
                    await send(
                        .fetchProductsResponse(
                            TaskResult { Product.fixture }
                        )
                    )
                }
            case .fetchProductsResponse(.success(let products)):
                state.productList = IdentifiedArrayOf(
                    uniqueElements: products.map {
                        ProductDomain.State(
                            id: uuid(),
                            product: $0
                        )
                    }
                )
                return .none
            case .fetchProductsResponse(.failure(let error)):
                print(error)
                print("Error getting products, try again later.")
                return .none
            case .product:
                return .none
            }
        }
        .forEach(\.productList, action: \.product) {
            ProductDomain()
        }
    }
}
