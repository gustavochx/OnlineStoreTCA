//
//  Product.swift
//  OnlineStoreTCA
//
//  Created by Gustavo Soares on 17/10/24.
//

import Foundation

struct Product: Equatable, Identifiable {
    let id: Int
    let title: String
    let currency: Double
    let description: String
    let category: String
    let imageString: String
}

extension Product: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, title, currency, description, category, imageString
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.currency = try container.decode(Double.self, forKey: .currency)
        self.description = try container.decode(String.self, forKey: .description)
        self.category = try container.decode(String.self, forKey: .category)
        self.imageString = try container.decode(String.self, forKey: .imageString)
    }
}

#if DEBUG
// swiftlint:disable line_length
extension Product {
    static var fixture: [Product] {
        [
            .init(
                id: 1,
                title: "Mens Casual Premium Slim Fit T-Shirts",
                currency: 22.3,
                description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
                category: "men's clothing",
                imageString: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"
            ),
            .init(
                id: 2,
                title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                currency: 109.95,
                description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                category: "men's clothing",
                imageString: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
            ),
            .init(
                id: 3,
                title: "Mens Cotton Jacket",
                currency: 55.99,
                description: "Great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
                category: "men's clothing",
                imageString: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg"
            )
        ]
    }
}
// swiftlint: enable line_length
#endif
