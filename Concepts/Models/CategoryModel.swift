//
//  CategoryModel.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-02.
//

import Foundation

struct CategoryModel: Codable, Identifiable, Hashable {
    var id = UUID()
    var title: String
    var description: String
}
