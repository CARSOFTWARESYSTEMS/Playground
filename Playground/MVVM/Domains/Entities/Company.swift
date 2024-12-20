//
//  Company.swift
//  Playground
//
//  Created by Krishna Prakash on 08/06/24.
//

import Foundation

struct Company: Identifiable, Codable {
    let id: String
    let name: String
    let logo: String
    let products: [Product]
}

struct Product: Identifiable, Codable {
    let id: String
    let name: String
    let type: String
    let currentValue: Double
    let percentageChange: Double
    let symbol: String
    let timestamp: String
    let image: String
}

struct CompaniesResponse: Codable {
    let companies: [Company]
}
