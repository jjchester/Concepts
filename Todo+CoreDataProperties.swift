//
//  Todo+CoreDataProperties.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-10.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var text: String?
    @NSManaged public var isDone: Bool

}

extension Todo : Identifiable {

}
