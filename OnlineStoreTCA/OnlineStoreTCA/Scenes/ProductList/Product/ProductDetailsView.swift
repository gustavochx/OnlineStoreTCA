//
//  ProductDetailsView.swift
//  OnlineStoreTCA
//
//  Created by Gustavo Soares on 17/10/24.
//

import ComposableArchitecture
import SwiftUI

struct ProductDetailsView: View {
    let store: StoreOf<ProductDomain>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                AsyncImage(url: URL(string: store.product.imageString)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                } placeholder: {
                    ProgressView()
                        .frame(height: 300)
                }
                VStack(alignment: .leading) {
                    Text(store.product.title)
                    HStack {
                        Text("$\(store.product.currency.description)")
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
                .font(.system(size: 20))
            }
            .padding(20)
        }
    }
}

#Preview {
    ProductDetailsView(
        store: Store(
            initialState: ProductDomain.State(
                id: UUID(),
                product: Product.fixture[0]
            ),
            reducer: { ProductDomain() }
        )
    )
    .previewLayout(.fixed(width: 300, height: 300))
}
