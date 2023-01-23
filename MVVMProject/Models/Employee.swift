//
//  Employee.swift
//  MVVMProject
//
//  Created by Santos, Rafael Costa on 21/01/2023.
//

// MARK: - Products
struct Products: Decodable {
    let products: [ProductsData]
    let total: Int
    let skip: Int
    let limit: Int
}

// MARK: - Products
struct ProductsData: Decodable {
    let id: Int
    let title, description, brand, category, thumbnail: String
    let price, stock: Int
    let discountPercentage, rating: Double
    let images: [String]
        
    enum CodingKeys: CodingKey {
        case id
        case title
        case description
        case brand
        case category
        case thumbnail
        case price
        case stock
        case discountPercentage
        case rating
        case images
    }
}
