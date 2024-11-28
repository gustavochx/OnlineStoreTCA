//
//  ProductDomain.swift
//  OnlineStoreTCA
//
//  Created by Gustavo Soares on 17/10/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct ProductDomain {
    @ObservableState
    struct State: Equatable, Identifiable {
        let id: UUID
        let product: Product
    }
}
