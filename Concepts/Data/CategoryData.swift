//
//  CategoryData.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-03.
//

import Foundation

struct CategoryData {
    static var categoryData: [CategoryModel] = [
        CategoryModel(title: "Grand Central Dispatch", description: "Learn about Apple's system-managed concurrency library."),
        CategoryModel(title: "The Delegate Pattern", description: "Learn about a common Cocoa pattern that allows classes and structures to delegate responsibilities to other types."),
        CategoryModel(title: "CoreData", description: "A data persistence framework for storing app data on your device (And CloudKit)")
    ]
}
