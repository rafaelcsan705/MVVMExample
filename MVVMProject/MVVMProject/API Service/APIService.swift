//
//  APIService.swift
//  MVVMProject
//
//  Created by Santos, Rafael Costa on 21/01/2023.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
    
    func apiToGetEmployeeData(completion: @escaping (Employees) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let empData = try jsonDecoder.decode(Employees.self, from: data)
                    completion(empData)
                } catch {
                    print("Error getting data: \(error)")
                }
            }
        }.resume()
    }
}
