//
//  ConceptView.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-05.
//

import Foundation
import SwiftUI

struct ConceptView: View {
    let title: String
    
    var body: some View {
        switch title {
        case "Grand Central Dispatch":
            return AnyView(GCDView())
        case "The Delegate Pattern":
            return AnyView(DelegatePatternView())
        case "CoreData":
            return AnyView(CoreDataView())
        default:
            return AnyView(GCDView())
        }
    }
}
