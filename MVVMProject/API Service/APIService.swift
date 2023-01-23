//
//  APIService.swift
//  MVVMProject
//
//  Created by Santos, Rafael Costa on 21/01/2023.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://dummyjson.com/products")!
    
    func apiToGetEmployeeData(completion: @escaping (Products) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let products = try jsonDecoder.decode(Products.self, from: data)
                    completion(products)
                } catch {
                    print("Error: \(error)")
                }
            }
        }.resume()
    }
}

//let json = try? JSONSerialization.jsonObject(with: data)
//let data1 = try? JSONSerialization.data(withJSONObject: json)
//if let convertedString = String(data: data1!, encoding: String.Encoding.utf8) {
//    let data2: Data = convertedString.data(using: String.Encoding.utf8)!
//    let anyObj: EmployeeData = try JSONSerialization.jsonObject(with: data2, options: JSONSerialization.ReadingOptions(rawValue: 0)) as! EmployeeData
//
//    print("AnyObj: \(anyObj)")
//}
//                        print("id:                  \(anyObj?["id"] as? Int)")
//                        print("title:               \(anyObj?["title"] as? String)")
//                        print("description:         \(anyObj?["description"] as? String)")
//                        print("price:               \(anyObj?["price"] as? Int)")
//                        print("discountPercentage:  \(anyObj?["discountPercentage"] as? Double)")
//                        print("rating:              \(anyObj?["rating"] as? Double)")
//                        print("stock:               \(anyObj?["stock"] as? Int)")
//                        print("brand:               \(anyObj?["brand"] as? String)")
//                        print("category:            \(anyObj?["category"] as? String)")
//                        print("thumbnail:           \(anyObj?["thumbnail"] as? String)")
//                        print("images:              \(anyObj?["images"] as? [String])")
